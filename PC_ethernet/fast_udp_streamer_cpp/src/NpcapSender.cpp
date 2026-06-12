#define NOMINMAX
#include "NpcapSender.hpp"
#include <pcap.h>
#include <chrono>
#include <iostream>
#include <stdexcept>
#include <thread>

static pcap_if_t* find_adapter(pcap_if_t* alldevs, int idx) { int i=1; for (pcap_if_t* d=alldevs; d; d=d->next, ++i) if (i==idx) return d; return nullptr; }

std::vector<AdapterInfo> list_adapters() {
    char errbuf[PCAP_ERRBUF_SIZE] = {}; pcap_if_t* alldevs = nullptr;
    if (pcap_findalldevs(&alldevs, errbuf) == -1) throw std::runtime_error(std::string("pcap_findalldevs failed: ") + errbuf);
    std::vector<AdapterInfo> out; int i=1; for (pcap_if_t* d=alldevs; d; d=d->next, ++i) out.push_back({i, d->name ? d->name : "", d->description ? d->description : "No description"});
    pcap_freealldevs(alldevs); return out;
}

static void wait_precise(std::chrono::high_resolution_clock::time_point target, bool high_precision) {
    if (!high_precision) { std::this_thread::sleep_until(target); return; }
    while (true) {
        auto now = std::chrono::high_resolution_clock::now(); if (now >= target) return;
        auto rem = target - now; if (rem > std::chrono::microseconds(500)) std::this_thread::sleep_for(std::chrono::microseconds(100));
    }
}

void send_packets_npcap(int adapter_index, const std::vector<std::vector<uint8_t>>& packets, const std::vector<size_t>& payload_sizes, const StreamConfig& cfg) {
    if (packets.empty() || packets.size() != payload_sizes.size()) throw std::runtime_error("Bad packet list");
    char errbuf[PCAP_ERRBUF_SIZE] = {}; pcap_if_t* alldevs = nullptr;
    if (pcap_findalldevs(&alldevs, errbuf) == -1) throw std::runtime_error(std::string("pcap_findalldevs failed: ") + errbuf);
    pcap_if_t* adapter = find_adapter(alldevs, adapter_index); if (!adapter) { pcap_freealldevs(alldevs); throw std::runtime_error("Invalid adapter index"); }
    std::cout << "\nOpening adapter:\n  " << (adapter->description ? adapter->description : "No description") << "\n  " << adapter->name << "\n";
    pcap_t* handle = pcap_open_live(adapter->name, 65536, 1, 1, errbuf);
    if (!handle) { std::string msg = std::string("pcap_open_live failed: ") + errbuf; pcap_freealldevs(alldevs); throw std::runtime_error(msg); }
    uint64_t sent_packets=0, sent_frame_bytes=0, sent_payload_bytes=0, repeat=0;
    auto start = std::chrono::high_resolution_clock::now(); auto next = start;
    while (cfg.continuous || repeat < cfg.repeat_count) {
        for (size_t i=0; i<packets.size(); ++i) {
            if (cfg.target_payload_rate_bps > 0.0 && sent_packets > 0) wait_precise(next, cfg.high_precision_timing);
            if (pcap_sendpacket(handle, packets[i].data(), int(packets[i].size())) != 0) { std::cerr << "pcap_sendpacket failed: " << pcap_geterr(handle) << "\n"; pcap_close(handle); pcap_freealldevs(alldevs); return; }
            ++sent_packets; sent_frame_bytes += packets[i].size(); sent_payload_bytes += payload_sizes[i];
            if (cfg.target_payload_rate_bps > 0.0) {
                double seconds = (double(payload_sizes[i]) * 8.0) / cfg.target_payload_rate_bps;
                next += std::chrono::duration_cast<std::chrono::high_resolution_clock::duration>(std::chrono::duration<double>(seconds));
            }
        }
        ++repeat; if (!cfg.continuous && repeat % 1000 == 0) std::cout << "  repeats sent: " << repeat << "\r" << std::flush;
    }
    auto end = std::chrono::high_resolution_clock::now(); double elapsed = std::chrono::duration<double>(end - start).count();
    std::cout << "\n\nDone.\n  Sent packets: " << sent_packets << "\n  Sent frame bytes: " << sent_frame_bytes << "\n  Sent payload bytes: " << sent_payload_bytes << "\n  Elapsed [s]: " << elapsed << "\n";
    if (elapsed > 0) std::cout << "  Packet rate [pps]: " << double(sent_packets)/elapsed << "\n  Payload rate [bps]: " << double(sent_payload_bytes)*8.0/elapsed << "\n";
    pcap_close(handle); pcap_freealldevs(alldevs);
}
