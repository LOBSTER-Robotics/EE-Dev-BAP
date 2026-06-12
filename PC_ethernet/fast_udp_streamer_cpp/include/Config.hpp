#pragma once

#include <cstdint>
#include <string>

enum class PayloadMode {
    TextFileHex16 = 1,
    SineWave = 2,
    Ramp = 3
};

struct StreamConfig {
    std::string dst_mac = "00:11:22:33:44:55";
    std::string src_mac = "12:34:56:78:9A:BC";
    std::string src_ip = "192.168.1.10";
    std::string dst_ip = "192.168.1.100";
    uint16_t udp_src_port = 5000;
    uint16_t udp_dst_port = 1234;

    PayloadMode payload_mode = PayloadMode::SineWave;
    std::string input_txt_file = "examples/example_hex16.txt";

    double sine_freq_hz = 10000.0;
    double sample_rate_hz = 2000000.0;
    double amplitude_scale = 0.95;

    uint16_t ramp_start = 0;
    uint16_t ramp_step = 1;

    int num_channels = 1;
    bool sample_big_endian = true;
    bool sample_signed = true;
    int max_udp_payload_bytes = 1440;

    bool auto_sine_payload_packing = true;
    int manual_samples_per_payload = 45;

    // Payload data rate, not Ethernet line rate. Use 0 for max speed.
    double target_payload_rate_bps = 32000000.0;

    uint64_t repeat_count = 1000;
    bool continuous = false;
    bool high_precision_timing = true;
};
