#pragma once
#include "Config.hpp"
#include <cstdint>
#include <string>
#include <vector>
struct AdapterInfo { int index = 0; std::string name; std::string description; };
std::vector<AdapterInfo> list_adapters();
void send_packets_npcap(int adapter_index, const std::vector<std::vector<uint8_t>>& packets, const std::vector<size_t>& payload_sizes, const StreamConfig& cfg);
