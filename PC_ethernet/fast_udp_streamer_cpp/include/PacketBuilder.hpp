#pragma once
#include "Config.hpp"
#include <cstdint>
#include <vector>
std::vector<uint8_t> build_udp_packet(const StreamConfig& cfg, const std::vector<uint8_t>& udp_payload);
