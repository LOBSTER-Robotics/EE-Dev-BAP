#pragma once
#include "Config.hpp"
#include <string>
#include <vector>

struct AdapterInfo {
    int index;
    std::string name;
    std::string description;
};

std::vector<AdapterInfo> list_adapters();
void run_logger(int adapter_index, const LoggerConfig& cfg);
