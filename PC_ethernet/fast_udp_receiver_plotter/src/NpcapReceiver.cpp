#define NOMINMAX
#include "NpcapReceiver.hpp"
#include "PacketParser.hpp"
#include "SampleDecoder.hpp"
#include <pcap.h>
#include <chrono>
#include <csignal>
#include <iostream>
#include <stdexcept>

static volatile std::sig_atomic_t g_stop = 0;
static void signal_handler(int) { g_stop = 1; }

static pcap_if_t* find_adapter_by_index(pcap_if_t* alldevs, int adapter_index) {
    int i = 1;
    for (pcap_if_t* d = alldevs; d != nullptr; d = d->next, ++i) if (i == adapter_index) return d;
    return nullptr;
}

std::vector<AdapterInfo> list_adapters() {
    char errbuf[PCAP_ERRBUF_SIZE] = {};
    pcap_if_t* alldevs = nullptr;
    if (pcap_findalldevs(&alldevs, errbuf) == -1) throw std::runtime_error(std::string("pcap_findalldevs failed: ") + errbuf);
    std::vector<AdapterInfo> out; int i = 1;
    for (pcap_if_t* d = alldevs; d != nullptr; d = d->next, ++i) {
        out.push_back({i, d->name ? d->name : "", d->description ? d->description : "No description"});
    }
    pcap_freealldevs(alldevs);
    return out;
}

void receive_packets(int adapter_index, const RxConfig& cfg) {
    std::signal(SIGINT, signal_handler);
    char errbuf[PCAP_ERRBUF_SIZE] = {};
    pcap_if_t* alldevs = nullptr;
    if (pcap_findalldevs(&alldevs, errbuf) == -1) throw std::runtime_error(std::string("pcap_findalldevs failed: ") + errbuf);
    pcap_if_t* adapter = find_adapter_by_index(alldevs, adapter_index);
    if (!adapter) { pcap_freealldevs(alldevs); throw std::runtime_error("Invalid adapter index"); }

    std::cout << "\nOpening adapter:\n  " << (adapter->description ? adapter->description : "No description") << "\n  " << adapter->name << "\n";
    pcap_t* handle = pcap_open_live(adapter->name, 65536, 1, 10, errbuf);
    if (!handle) { std::string msg = std::string("pcap_open_live failed: ") + errbuf; pcap_freealldevs(alldevs); throw std::runtime_error(msg); }

    bpf_program fp{};
    if (pcap_compile(handle, &fp, "udp", 1, PCAP_NETMASK_UNKNOWN) == 0) { pcap_setfilter(handle, &fp); pcap_freecode(&fp); }
    else std::cout << "Warning: could not apply BPF filter. Continuing without it.\n";

    SampleDecoder24Lsb decoder(cfg); decoder.open_csv();
    std::cout << "\nReceiving. Press Ctrl+C to stop.\nWriting CSV: " << cfg.csv_file << "\n";

    auto start = std::chrono::high_resolution_clock::now();
    uint64_t raw_packets = 0, matched_packets = 0;
    while (!g_stop) {
        pcap_pkthdr* header = nullptr; const u_char* data = nullptr;
        int r = pcap_next_ex(handle, &header, &data);
        if (r == 0) continue;
        if (r < 0) { std::cerr << "pcap_next_ex error: " << pcap_geterr(handle) << "\n"; break; }
        ++raw_packets;
        UdpPayloadView payload;
        if (!extract_matching_udp_payload(data, header->caplen, cfg, payload)) continue;
        ++matched_packets;
        decoder.process_payload(payload.data, payload.size);
        if (cfg.verbose && (matched_packets % 1000 == 0)) std::cout << "Matched packets: " << matched_packets << " CSV rows: " << decoder.total_frames_written() << "\r" << std::flush;
        if (cfg.max_csv_rows != 0 && decoder.total_frames_written() >= cfg.max_csv_rows) break;
    }
    decoder.close_csv();
    auto end = std::chrono::high_resolution_clock::now();
    double elapsed_s = std::chrono::duration<double>(end - start).count();
    std::cout << "\n\nDone.\n";
    std::cout << "  Raw packets seen:       " << raw_packets << "\n";
    std::cout << "  Matching UDP packets:   " << matched_packets << "\n";
    std::cout << "  Payload bytes decoded:  " << decoder.total_payload_bytes() << "\n";
    std::cout << "  CSV rows written:       " << decoder.total_frames_written() << "\n";
    std::cout << "  Elapsed [s]:            " << elapsed_s << "\n";
    if (elapsed_s > 0.0) {
        std::cout << "  Matched packets/s:      " << matched_packets / elapsed_s << "\n";
        std::cout << "  Payload bytes/s:        " << decoder.total_payload_bytes() / elapsed_s << "\n";
    }
    pcap_close(handle); pcap_freealldevs(alldevs);
}
