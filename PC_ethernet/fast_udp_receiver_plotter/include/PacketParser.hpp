#pragma once
#include "Config.hpp"
#include <cstdint>
#include <cstddef>

struct UdpPayloadView {
    const uint8_t* data = nullptr;
    size_t size = 0;
};

bool extract_matching_udp_payload(
    const uint8_t* frame,
    size_t frame_len,
    const RxConfig& cfg,
    UdpPayloadView& out
);
