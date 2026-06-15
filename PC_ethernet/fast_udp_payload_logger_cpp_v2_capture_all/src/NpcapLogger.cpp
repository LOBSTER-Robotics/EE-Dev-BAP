#define NOMINMAX
#include "NpcapLogger.hpp"

#include "PacketParser.hpp"
#include "PayloadWriter.hpp"

#include <pcap.h>
#include <chrono>
#include <csignal>
#include <iostream>
#include <stdexcept>

static volatile std::sig_atomic_t g_stop_requested = 0;

static void on_ctrl_c(int) {
    g_stop_requested = 1;
}

static pcap_if_t* adapter_by_index(pcap_if_t* alldevs, int index) {
    int i = 1;
    for (pcap_if_t* d = alldevs; d != nullptr; d = d->next, ++i) {
        if (i == index) return d;
    }
    return nullptr;
}

std::vector<AdapterInfo> list_adapters() {
    char errbuf[PCAP_ERRBUF_SIZE] = {};
    pcap_if_t* alldevs = nullptr;

    if (pcap_findalldevs(&alldevs, errbuf) == -1) {
        throw std::runtime_error(std::string("pcap_findalldevs failed: ") + errbuf);
    }

    std::vector<AdapterInfo> out;
    int i = 1;

    for (pcap_if_t* d = alldevs; d != nullptr; d = d->next, ++i) {
        out.push_back(AdapterInfo{
            i,
            d->name ? d->name : "",
            d->description ? d->description : "No description"
        });
    }

    pcap_freealldevs(alldevs);
    return out;
}

static std::string build_bpf_filter(const LoggerConfig& cfg) {
    std::string f = "udp";

    if (!cfg.expected_src_ip.empty()) f += " and src host " + cfg.expected_src_ip;
    if (!cfg.expected_dst_ip.empty()) f += " and dst host " + cfg.expected_dst_ip;
    if (cfg.expected_udp_src_port != 0) f += " and src port " + std::to_string(cfg.expected_udp_src_port);
    if (cfg.expected_udp_dst_port != 0) f += " and dst port " + std::to_string(cfg.expected_udp_dst_port);

    return f;
}

void run_logger(int adapter_index, const LoggerConfig& cfg) {
    std::signal(SIGINT, on_ctrl_c);
    g_stop_requested = 0;

    char errbuf[PCAP_ERRBUF_SIZE] = {};
    pcap_if_t* alldevs = nullptr;

    if (pcap_findalldevs(&alldevs, errbuf) == -1) {
        throw std::runtime_error(std::string("pcap_findalldevs failed: ") + errbuf);
    }

    pcap_if_t* adapter = adapter_by_index(alldevs, adapter_index);
    if (!adapter) {
        pcap_freealldevs(alldevs);
        throw std::runtime_error("Invalid adapter index");
    }

    std::cout << "\nOpening adapter:\n";
    std::cout << "  " << (adapter->description ? adapter->description : "No description") << "\n";
    std::cout << "  " << adapter->name << "\n";

    pcap_t* handle = pcap_open_live(adapter->name, 65536, 1, 1, errbuf);
    if (!handle) {
        std::string msg = std::string("pcap_open_live failed: ") + errbuf;
        pcap_freealldevs(alldevs);
        throw std::runtime_error(msg);
    }

    std::string bpf = build_bpf_filter(cfg);
    bpf_program fp{};

    if (pcap_compile(handle, &fp, bpf.c_str(), 1, PCAP_NETMASK_UNKNOWN) == 0) {
        if (pcap_setfilter(handle, &fp) != 0) {
            std::cout << "Warning: pcap_setfilter failed: " << pcap_geterr(handle) << "\n";
        }
        pcap_freecode(&fp);
    } else {
        std::cout << "Warning: pcap_compile failed for filter: " << bpf << "\n";
    }

    PayloadWriter writer(cfg);
    writer.open();

    uint64_t raw_packets = 0;
    uint64_t matched_packets = 0;
    uint64_t matched_payload_bytes = 0;
    uint64_t udp_reported_payload_bytes_total = 0;
    uint64_t captured_after_udp_header_total = 0;
    uint64_t ip_after_udp_header_total = 0;

    auto start = std::chrono::high_resolution_clock::now();
    auto last_print = start;

    std::cout << "\nLogging started. Press Ctrl+C to stop.\n";
    std::cout << "BPF filter: " << bpf << "\n";
    std::cout << "Output file: " << cfg.output_file << "\n";
    std::cout << "Payload length mode: " << static_cast<int>(cfg.payload_length_mode) << "\n\n";

    while (!g_stop_requested) {
        pcap_pkthdr* header = nullptr;
        const u_char* data = nullptr;

        int r = pcap_next_ex(handle, &header, &data);

        if (r == 0) continue;

        if (r < 0) {
            std::cerr << "pcap_next_ex error: " << pcap_geterr(handle) << "\n";
            break;
        }

        ++raw_packets;

        PayloadView payload;
        if (!extract_payload(data, header->caplen, cfg, payload)) continue;

        ++matched_packets;
        matched_payload_bytes += payload.size;
        udp_reported_payload_bytes_total += payload.udp_reported_payload_size;
        captured_after_udp_header_total += payload.captured_after_udp_header_size;
        ip_after_udp_header_total += payload.ip_after_udp_header_size;

        writer.write_payload(payload.data, payload.size);

        if (cfg.flush_every_packets != 0 && (matched_packets % cfg.flush_every_packets) == 0) writer.flush();
        if (cfg.max_matching_packets != 0 && matched_packets >= cfg.max_matching_packets) break;
        if (cfg.max_payload_bytes != 0 && matched_payload_bytes >= cfg.max_payload_bytes) break;

        if (cfg.verbose) {
            auto now = std::chrono::high_resolution_clock::now();
            double dt = std::chrono::duration<double>(now - last_print).count();

            if (dt >= 1.0) {
                double elapsed = std::chrono::duration<double>(now - start).count();
                double mbps = (matched_payload_bytes * 8.0) / elapsed / 1e6;
                double pps = matched_packets / elapsed;

                std::cout << "matched=" << matched_packets
                          << " saved_MB=" << (matched_payload_bytes / 1e6)
                          << " saved_Mb/s=" << mbps
                          << " pkt/s=" << pps
                          << "\r" << std::flush;

                last_print = now;
            }
        }
    }

    writer.close();

    auto end = std::chrono::high_resolution_clock::now();
    double elapsed = std::chrono::duration<double>(end - start).count();

    std::cout << "\n\nDone.\n";
    std::cout << "  Raw packets seen:                       " << raw_packets << "\n";
    std::cout << "  Matching UDP packets:                   " << matched_packets << "\n";
    std::cout << "  Saved payload bytes:                    " << writer.payload_bytes_written() << "\n";
    std::cout << "  Payloads written:                       " << writer.payloads_written() << "\n";
    std::cout << "  Total UDP-header-reported payload bytes:" << udp_reported_payload_bytes_total << "\n";
    std::cout << "  Total IP-after-UDP-header bytes:        " << ip_after_udp_header_total << "\n";
    std::cout << "  Total captured-after-UDP-header bytes:  " << captured_after_udp_header_total << "\n";

    if (cfg.output_mode == OutputMode::Decoded24Csv) {
        std::cout << "  Decoded CSV rows:                       " << writer.decoded_csv_rows() << "\n";
    }

    std::cout << "  Elapsed [s]:                            " << elapsed << "\n";

    if (elapsed > 0.0) {
        std::cout << "  Saved payload Mb/s:                     " << (writer.payload_bytes_written() * 8.0 / elapsed / 1e6) << "\n";
        std::cout << "  Matching packets/s:                     " << (matched_packets / elapsed) << "\n";
    }

    pcap_close(handle);
    pcap_freealldevs(alldevs);
}
