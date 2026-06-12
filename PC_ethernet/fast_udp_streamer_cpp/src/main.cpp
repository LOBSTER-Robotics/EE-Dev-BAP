#define NOMINMAX
#include "ConsoleUI.hpp"
#include "NpcapSender.hpp"
#include "PacketBuilder.hpp"
#include "PayloadGenerator.hpp"
#include <windows.h>
#include <iostream>
#include <vector>

int main() {
    try {
        StreamConfig cfg = run_console_interface();
        int adapter_index = 0; std::cout << "Choose adapter number to use: "; std::cin >> adapter_index;
        PayloadPattern pattern = generate_payload_pattern(cfg);
        std::vector<std::vector<uint8_t>> packets; std::vector<size_t> payload_sizes;
        for (const auto& payload : pattern.payloads) { payload_sizes.push_back(payload.size()); packets.push_back(build_udp_packet(cfg, payload)); }
        std::cout << "\nPrecomputed packet pattern:\n  Description: " << pattern.description << "\n  Packets per pattern: " << packets.size() << "\n  Target payload rate: " << cfg.target_payload_rate_bps << " bps\n  Continuous: " << (cfg.continuous?"true":"false") << "\n  Repeat count: " << cfg.repeat_count << "\n";
        if (pattern.samples_per_wave) std::cout << "  Samples per wave: " << pattern.samples_per_wave << "\n";
        if (pattern.samples_per_payload) std::cout << "  Samples per payload: " << pattern.samples_per_payload << "\n";
        if (pattern.waves_per_payload) std::cout << "  Waves per payload: " << pattern.waves_per_payload << "\n";
        for (size_t i=0; i<packets.size(); ++i) std::cout << "  Packet " << i << ": UDP payload " << payload_sizes[i] << " bytes, Ethernet frame " << packets[i].size() << " bytes\n";
        std::cout << "\nStarting in 2 seconds... Use Ctrl+C to stop continuous sending.\n"; Sleep(2000);
        send_packets_npcap(adapter_index, packets, payload_sizes, cfg);
        return 0;
    } catch (const std::exception& e) { std::cerr << "\nERROR: " << e.what() << "\n"; return 1; }
}
