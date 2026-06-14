#pragma once
#include "Config.hpp"
#include <cstddef>
#include <cstdint>

struct PayloadView {
    const uint8_t* data = nullptr;
    size_t size = 0;
    uint16_t udp_reported_payload_size = 0;
    size_t captured_after_udp_header_size = 0;
    size_t ip_after_udp_header_size = 0;
};

bool extract_payload(
    const uint8_t* frame,
    size_t frame_len,
    const LoggerConfig& cfg,
    PayloadView& payload
);
