#pragma once
#include "Config.hpp"
#include <cstdint>
#include <string>
#include <vector>
struct PayloadPattern {
    std::vector<std::vector<uint8_t>> payloads;
    std::string description;
    double actual_signal_rate_hz = 0.0;
    int samples_per_wave = 0;
    int samples_per_payload = 0;
    int waves_per_payload = 0;
};
PayloadPattern generate_payload_pattern(const StreamConfig& cfg);
