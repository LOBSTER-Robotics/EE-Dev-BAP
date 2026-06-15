#pragma once
#include "Config.hpp"
#include <cstddef>
#include <cstdint>
struct PayloadView { const uint8_t* data=nullptr; size_t size=0; };
bool extract_udp_payload(const uint8_t* frame,size_t frame_len,const LoggerConfig& cfg,PayloadView& payload);
