#pragma once
#include <cstdint>
#include <string>

struct RxConfig {
    // Empty strings disable that filter.
    std::string expected_dst_mac = "";
    std::string expected_src_mac = "";
    std::string expected_src_ip  = "192.168.1.100";
    std::string expected_dst_ip  = "192.168.1.10";

    // Set to 0 to disable UDP port filter.
    uint16_t expected_udp_src_port = 1234;
    uint16_t expected_udp_dst_port = 5000;

    // 24-bit incoming bitstream settings.
    // LSB byte order means bytes [b0 b1 b2] decode as:
    // value = b0 + (b1 << 8) + (b2 << 16)
    bool sample_signed = true;
    int num_channels = 1;

    // CSV output / plotting.
    std::string csv_file = "output/samples.csv";

    // Write every Nth complete multi-channel frame.
    // Use 1 to write all frames, but that can be slow at high data rates.
    uint64_t csv_decimation = 1;

    // Stop after this many CSV rows. Use 0 for continuous until Ctrl+C.
    uint64_t max_csv_rows = 100000;

    bool verbose = false;
};
