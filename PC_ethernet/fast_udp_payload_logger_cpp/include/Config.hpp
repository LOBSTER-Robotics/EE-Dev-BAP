#pragma once
#include <cstdint>
#include <string>

enum class OutputMode { RawBinary = 1, HexText = 2, Decoded24Csv = 3 };

struct LoggerConfig {
    std::string expected_dst_mac = "";
    std::string expected_src_mac = "";
    std::string expected_src_ip = "192.168.1.100";
    std::string expected_dst_ip = "192.168.1.10";
    uint16_t expected_udp_src_port = 1234;
    uint16_t expected_udp_dst_port = 5000;
    OutputMode output_mode = OutputMode::RawBinary;
    std::string output_file = "output/payload.bin";
    bool signed_24bit = true;
    int num_channels = 1;
    uint64_t max_matching_packets = 0;
    uint64_t max_payload_bytes = 0;
    uint64_t flush_every_packets = 10000;
    bool verbose = true;
};
