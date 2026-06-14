#pragma once
#include "Config.hpp"
#include <string>
#include <vector>

struct AdapterInfo { int index = 0; std::string name; std::string description; };
std::vector<AdapterInfo> list_adapters();
void receive_packets(int adapter_index, const RxConfig& cfg);
