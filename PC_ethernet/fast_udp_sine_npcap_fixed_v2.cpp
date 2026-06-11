/*
    Fast Ethernet/IPv4/UDP sine-wave sender using Npcap/WinPcap API.

    This is intended as a faster alternative to Python Scapy for Windows.

    It sends raw Ethernet frames:
        Destination MAC: 00:11:22:33:44:55
        Source MAC:      12:34:56:78:9A:BC
        EtherType:       0x0800 IPv4

        Source IP:       192.168.1.10
        Destination IP:  192.168.1.100
        UDP source port: 5000
        UDP dest port:   1234

    Payload:
        16 channels
        16-bit samples
        interleaved per time sample:
            sample0 CH0, sample0 CH1, ... sample0 CH15,
            sample1 CH0, ...

    Compile on Windows with Visual Studio Developer Command Prompt:

        cl /EHsc fast_udp_sine_npcap.cpp /I"C:\Npcap-SDK\Include" /link /LIBPATH:"C:\Npcap-SDK\Lib\x64" wpcap.lib Packet.lib Ws2_32.lib

    You need:
        - Npcap installed
        - Npcap SDK downloaded
        - Run executable as Administrator
*/

#define _CRT_SECURE_NO_WARNINGS
#define NOMINMAX

#include <pcap.h>

#include <winsock2.h>
#include <ws2tcpip.h>

#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <iostream>
#include <string>
#include <thread>
#include <vector>

#pragma comment(lib, "wpcap.lib")
#pragma comment(lib, "Packet.lib")
#pragma comment(lib, "Ws2_32.lib")

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

// ============================================================
// Easy-to-change settings
// ============================================================

static const uint8_t DST_MAC[6] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55};
static const uint8_t SRC_MAC[6] = {0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC};

static const char* SRC_IP_STR = "192.168.1.10";
static const char* DST_IP_STR = "192.168.1.100";

static const uint16_t UDP_SRC_PORT = 5000;
static const uint16_t UDP_DST_PORT = 1234;

static const double SINE_FREQ_HZ = 10000.0;
static const double SAMPLE_RATE_HZ = 2000000.0;

static const int NUM_CHANNELS = 1;
static const int BYTES_PER_SAMPLE = 2;
static const int MAX_PAYLOAD_BYTES = 1440;

// If true, use big-endian sample bytes.
// If false, use little-endian sample bytes.
static const bool SAMPLE_BIG_ENDIAN = true;

// If true, samples are signed int16: -32768..32767.
// If false, samples are unsigned offset binary: 0..65535.
static const bool SAMPLE_SIGNED = false;

static const double AMPLITUDE_SCALE = 0.95;

// Auto payload packing:
// If one or more full sine waves fit in one packet, pack as many as possible.
// Otherwise split one sine wave across multiple packets.
static const bool AUTO_SAMPLES_PER_PAYLOAD = true;

// Used only if AUTO_SAMPLES_PER_PAYLOAD is false.
static const int MANUAL_SAMPLES_PER_PAYLOAD = 45;

// Sending
static const uint64_t REPEAT_COUNT = 100000;

// Interval between packets in microseconds.
// Example:
//   1000 = 1 ms
//   100  = 100 us
//   0    = send as fast as possible
static const uint64_t INTER_PACKET_INTERVAL_US = 0;

// Set this to your adapter number after listing interfaces.
static const int ADAPTER_INDEX_TO_USE = -1; // -1 means ask user


// ============================================================
// Utility functions
// ============================================================

static uint16_t read_be16(const uint8_t* p) {
    return static_cast<uint16_t>((p[0] << 8) | p[1]);
}

static void write_be16(uint8_t* p, uint16_t v) {
    p[0] = static_cast<uint8_t>((v >> 8) & 0xFF);
    p[1] = static_cast<uint8_t>(v & 0xFF);
}

static void write_be32(uint8_t* p, uint32_t v) {
    p[0] = static_cast<uint8_t>((v >> 24) & 0xFF);
    p[1] = static_cast<uint8_t>((v >> 16) & 0xFF);
    p[2] = static_cast<uint8_t>((v >> 8) & 0xFF);
    p[3] = static_cast<uint8_t>(v & 0xFF);
}

static uint16_t checksum16(const uint8_t* data, size_t len) {
    uint32_t sum = 0;

    while (len > 1) {
        sum += read_be16(data);
        data += 2;
        len -= 2;
    }

    if (len > 0) {
        sum += static_cast<uint16_t>(data[0] << 8);
    }

    while (sum >> 16) {
        sum = (sum & 0xFFFF) + (sum >> 16);
    }

    return static_cast<uint16_t>(~sum);
}

static uint32_t ipv4_to_u32_be(const char* ip_str) {
    in_addr addr{};
    if (inet_pton(AF_INET, ip_str, &addr) != 1) {
        throw std::runtime_error(std::string("Invalid IPv4 address: ") + ip_str);
    }

    // addr.s_addr is already in network byte order.
    return ntohl(addr.s_addr);
}

static void append_int16_sample(std::vector<uint8_t>& payload, int32_t sample_value) {
    if (SAMPLE_SIGNED) {
        int16_t v = static_cast<int16_t>(sample_value);

        if (SAMPLE_BIG_ENDIAN) {
            payload.push_back(static_cast<uint8_t>((static_cast<uint16_t>(v) >> 8) & 0xFF));
            payload.push_back(static_cast<uint8_t>(static_cast<uint16_t>(v) & 0xFF));
        } else {
            payload.push_back(static_cast<uint8_t>(static_cast<uint16_t>(v) & 0xFF));
            payload.push_back(static_cast<uint8_t>((static_cast<uint16_t>(v) >> 8) & 0xFF));
        }
    } else {
        uint16_t v = static_cast<uint16_t>(sample_value);

        if (SAMPLE_BIG_ENDIAN) {
            payload.push_back(static_cast<uint8_t>((v >> 8) & 0xFF));
            payload.push_back(static_cast<uint8_t>(v & 0xFF));
        } else {
            payload.push_back(static_cast<uint8_t>(v & 0xFF));
            payload.push_back(static_cast<uint8_t>((v >> 8) & 0xFF));
        }
    }
}

static int32_t sine_sample_value(int sample_index, int samples_per_wave) {
    double angle = 2.0 * M_PI * static_cast<double>(sample_index % samples_per_wave) /
                   static_cast<double>(samples_per_wave);
    double s = std::sin(angle);

    if (SAMPLE_SIGNED) {
        int amplitude = static_cast<int>(32767.0 * AMPLITUDE_SCALE);
        return static_cast<int32_t>(std::llround(amplitude * s));
    } else {
        int amplitude = static_cast<int>(32767.0 * AMPLITUDE_SCALE);
        return static_cast<int32_t>(std::llround(32768.0 + amplitude * s));
    }
}

struct PayloadPlan {
    int samples_per_wave = 0;
    int max_samples_per_payload = 0;
    int samples_per_payload = 0;
    int waves_per_payload = 0;
    int payloads_per_pattern = 0;
    std::string mode;
};

static PayloadPlan make_payload_plan() {
    PayloadPlan plan;

    const int bytes_per_time_sample = NUM_CHANNELS * BYTES_PER_SAMPLE;
    plan.max_samples_per_payload = MAX_PAYLOAD_BYTES / bytes_per_time_sample;

    if (plan.max_samples_per_payload <= 0) {
        throw std::runtime_error("MAX_PAYLOAD_BYTES is too small for one time sample");
    }

    double exact_samples_per_wave = SAMPLE_RATE_HZ / SINE_FREQ_HZ;
    plan.samples_per_wave = static_cast<int>(std::llround(exact_samples_per_wave));

    if (std::abs(exact_samples_per_wave - static_cast<double>(plan.samples_per_wave)) > 1e-9) {
        throw std::runtime_error(
            "SAMPLE_RATE_HZ / SINE_FREQ_HZ must be an integer for a repeatable sampled sine"
        );
    }

    if (AUTO_SAMPLES_PER_PAYLOAD) {
        plan.waves_per_payload = plan.max_samples_per_payload / plan.samples_per_wave;

        if (plan.waves_per_payload >= 1) {
            plan.samples_per_payload = plan.waves_per_payload * plan.samples_per_wave;
            plan.payloads_per_pattern = 1;
            plan.mode = "multiple_full_waves_per_payload";
        } else {
            plan.samples_per_payload = plan.max_samples_per_payload;
            plan.payloads_per_pattern =
                (plan.samples_per_wave + plan.samples_per_payload - 1) / plan.samples_per_payload;
            plan.mode = "split_one_wave_over_multiple_payloads";
        }
    } else {
        plan.samples_per_payload = MANUAL_SAMPLES_PER_PAYLOAD;

        if (plan.samples_per_payload <= 0) {
            throw std::runtime_error("MANUAL_SAMPLES_PER_PAYLOAD must be > 0");
        }

        if (plan.samples_per_payload * bytes_per_time_sample > MAX_PAYLOAD_BYTES) {
            throw std::runtime_error("Manual payload size exceeds MAX_PAYLOAD_BYTES");
        }

        plan.waves_per_payload = plan.samples_per_payload / plan.samples_per_wave;
        plan.payloads_per_pattern =
            (plan.samples_per_wave + plan.samples_per_payload - 1) / plan.samples_per_payload;
        plan.mode = "manual_samples_per_payload";
    }

    return plan;
}

static std::vector<std::vector<uint8_t>> generate_payloads(const PayloadPlan& plan) {
    std::vector<std::vector<uint8_t>> payloads;

    int total_samples_to_generate = 0;

    if (plan.mode == "multiple_full_waves_per_payload") {
        total_samples_to_generate = plan.samples_per_payload;
    } else {
        total_samples_to_generate = plan.samples_per_wave;
    }

    for (int start = 0; start < total_samples_to_generate; start += plan.samples_per_payload) {
        int count = std::min(plan.samples_per_payload, total_samples_to_generate - start);

        std::vector<uint8_t> payload;
        payload.reserve(static_cast<size_t>(count * NUM_CHANNELS * BYTES_PER_SAMPLE));

        for (int n = start; n < start + count; ++n) {
            int32_t value = sine_sample_value(n, plan.samples_per_wave);

            for (int ch = 0; ch < NUM_CHANNELS; ++ch) {
                append_int16_sample(payload, value);
            }
        }

        payloads.push_back(std::move(payload));
    }

    return payloads;
}


// ============================================================
// Packet creation
// ============================================================

static std::vector<uint8_t> build_packet(const std::vector<uint8_t>& udp_payload) {
    const size_t eth_len = 14;
    const size_t ip_len = 20;
    const size_t udp_len = 8;

    const size_t total_len = eth_len + ip_len + udp_len + udp_payload.size();

    if (udp_payload.size() > 65507) {
        throw std::runtime_error("UDP payload too large");
    }

    std::vector<uint8_t> pkt(total_len, 0);

    // Ethernet header
    std::memcpy(&pkt[0], DST_MAC, 6);
    std::memcpy(&pkt[6], SRC_MAC, 6);
    write_be16(&pkt[12], 0x0800);

    // IPv4 header
    size_t ip = eth_len;

    pkt[ip + 0] = 0x45; // version=4, IHL=5
    pkt[ip + 1] = 0x00; // DSCP/ECN
    write_be16(&pkt[ip + 2], static_cast<uint16_t>(ip_len + udp_len + udp_payload.size()));
    write_be16(&pkt[ip + 4], 0x0000); // identification
    write_be16(&pkt[ip + 6], 0x0000); // flags/fragment offset
    pkt[ip + 8] = 64;                 // TTL
    pkt[ip + 9] = 17;                 // UDP
    write_be16(&pkt[ip + 10], 0x0000); // checksum initially 0

    write_be32(&pkt[ip + 12], ipv4_to_u32_be(SRC_IP_STR));
    write_be32(&pkt[ip + 16], ipv4_to_u32_be(DST_IP_STR));

    uint16_t ip_checksum = checksum16(&pkt[ip], ip_len);
    write_be16(&pkt[ip + 10], ip_checksum);

    // UDP header
    size_t udp = eth_len + ip_len;

    write_be16(&pkt[udp + 0], UDP_SRC_PORT);
    write_be16(&pkt[udp + 2], UDP_DST_PORT);
    write_be16(&pkt[udp + 4], static_cast<uint16_t>(udp_len + udp_payload.size()));
    write_be16(&pkt[udp + 6], 0x0000); // UDP checksum disabled for IPv4

    // Payload
    std::memcpy(&pkt[udp + udp_len], udp_payload.data(), udp_payload.size());

    return pkt;
}

static std::vector<std::vector<uint8_t>> build_packets(const std::vector<std::vector<uint8_t>>& payloads) {
    std::vector<std::vector<uint8_t>> packets;
    packets.reserve(payloads.size());

    for (const auto& payload : payloads) {
        packets.push_back(build_packet(payload));
    }

    return packets;
}


// ============================================================
// Npcap adapter handling
// ============================================================

static pcap_if_t* list_adapters(pcap_if_t** alldevs) {
    char errbuf[PCAP_ERRBUF_SIZE];

    if (pcap_findalldevs(alldevs, errbuf) == -1) {
        throw std::runtime_error(std::string("pcap_findalldevs failed: ") + errbuf);
    }

    int i = 0;
    for (pcap_if_t* d = *alldevs; d != nullptr; d = d->next) {
        std::cout << ++i << ": " << (d->description ? d->description : "No description") << "\n";
        std::cout << "    " << d->name << "\n";
    }

    if (i == 0) {
        throw std::runtime_error("No Npcap adapters found");
    }

    return *alldevs;
}

static pcap_if_t* choose_adapter(pcap_if_t* alldevs) {
    int chosen_index = ADAPTER_INDEX_TO_USE;

    if (chosen_index < 1) {
        std::cout << "\nChoose adapter number: ";
        std::cin >> chosen_index;
    }

    int i = 1;
    for (pcap_if_t* d = alldevs; d != nullptr; d = d->next, ++i) {
        if (i == chosen_index) {
            return d;
        }
    }

    throw std::runtime_error("Invalid adapter index");
}


// ============================================================
// Main
// ============================================================

int main() {
    try {
        std::cout << "Fast UDP sine sender using Npcap\n\n";

        PayloadPlan plan = make_payload_plan();
        auto payloads = generate_payloads(plan);
        auto packets = build_packets(payloads);

        std::cout << "Sine/payload plan:\n";
        std::cout << "  Sine frequency [Hz]:        " << SINE_FREQ_HZ << "\n";
        std::cout << "  Sample rate [S/s]:          " << SAMPLE_RATE_HZ << "\n";
        std::cout << "  Samples per wave:           " << plan.samples_per_wave << "\n";
        std::cout << "  Max samples per payload:    " << plan.max_samples_per_payload << "\n";
        std::cout << "  Chosen samples per payload: " << plan.samples_per_payload << "\n";
        std::cout << "  Waves per payload:          " << plan.waves_per_payload << "\n";
        std::cout << "  Payload pattern packets:    " << packets.size() << "\n";
        std::cout << "  Packing mode:               " << plan.mode << "\n";

        for (size_t i = 0; i < payloads.size(); ++i) {
            std::cout << "  Payload " << i << " bytes:          " << payloads[i].size()
                      << "  Ethernet frame bytes: " << packets[i].size() << "\n";
        }

        std::cout << "\nSending:\n";
        std::cout << "  Repeat count:               " << REPEAT_COUNT << "\n";
        std::cout << "  Inter-packet interval [us]: " << INTER_PACKET_INTERVAL_US << "\n\n";

        pcap_if_t* alldevs = nullptr;
        list_adapters(&alldevs);

        pcap_if_t* adapter = choose_adapter(alldevs);

        char errbuf[PCAP_ERRBUF_SIZE];
        pcap_t* handle = pcap_open_live(
            adapter->name,
            65536,
            1,
            1,
            errbuf
        );

        if (!handle) {
            std::string msg = std::string("pcap_open_live failed: ") + errbuf;
            pcap_freealldevs(alldevs);
            throw std::runtime_error(msg);
        }

        std::cout << "\nUsing adapter:\n";
        std::cout << "  " << (adapter->description ? adapter->description : "No description") << "\n";
        std::cout << "  " << adapter->name << "\n\n";

        auto start_time = std::chrono::high_resolution_clock::now();
        uint64_t sent_packets = 0;
        uint64_t sent_bytes = 0;

        auto next_send_time = std::chrono::high_resolution_clock::now();

        for (uint64_t repeat = 0; repeat < REPEAT_COUNT; ++repeat) {
            for (const auto& pkt : packets) {
                if (INTER_PACKET_INTERVAL_US > 0) {
                    std::this_thread::sleep_until(next_send_time);
                    next_send_time += std::chrono::microseconds(INTER_PACKET_INTERVAL_US);
                }

                int result = pcap_sendpacket(
                    handle,
                    pkt.data(),
                    static_cast<int>(pkt.size())
                );

                if (result != 0) {
                    std::cerr << "pcap_sendpacket failed: " << pcap_geterr(handle) << "\n";
                    break;
                }

                ++sent_packets;
                sent_bytes += pkt.size();
            }
        }

        auto end_time = std::chrono::high_resolution_clock::now();
        double elapsed_s = std::chrono::duration<double>(end_time - start_time).count();

        std::cout << "\nDone.\n";
        std::cout << "  Sent packets: " << sent_packets << "\n";
        std::cout << "  Sent bytes:   " << sent_bytes << "\n";
        std::cout << "  Elapsed [s]:  " << elapsed_s << "\n";
        std::cout << "  Packets/s:    " << (elapsed_s > 0 ? sent_packets / elapsed_s : 0) << "\n";
        std::cout << "  Bytes/s:      " << (elapsed_s > 0 ? sent_bytes / elapsed_s : 0) << "\n";

        pcap_close(handle);
        pcap_freealldevs(alldevs);

        return 0;
    }
    catch (const std::exception& e) {
        std::cerr << "\nERROR: " << e.what() << "\n";
        return 1;
    }
}
