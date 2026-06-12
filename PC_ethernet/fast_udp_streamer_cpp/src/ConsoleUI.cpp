#include "ConsoleUI.hpp"
#include "NpcapSender.hpp"
#include "Utils.hpp"
#include <iostream>
#include <string>

static std::string ask_string(const std::string& prompt, const std::string& cur) { std::cout << prompt << " [" << cur << "]: "; std::string l; std::getline(std::cin,l); l=trim(l); return l.empty()?cur:l; }
static int ask_int(const std::string& prompt, int cur) { std::cout << prompt << " [" << cur << "]: "; std::string l; std::getline(std::cin,l); l=trim(l); return l.empty()?cur:std::stoi(l); }
static uint16_t ask_u16(const std::string& prompt, uint16_t cur) { std::cout << prompt << " [" << cur << "]: "; std::string l; std::getline(std::cin,l); l=trim(l); return l.empty()?cur:parse_u16(l); }
static uint64_t ask_u64(const std::string& prompt, uint64_t cur) { std::cout << prompt << " [" << cur << "]: "; std::string l; std::getline(std::cin,l); l=trim(l); return l.empty()?cur:parse_u64(l); }
static double ask_double(const std::string& prompt, double cur) { std::cout << prompt << " [" << cur << "]: "; std::string l; std::getline(std::cin,l); l=trim(l); return l.empty()?cur:parse_double(l); }
static bool ask_bool(const std::string& prompt, bool cur) { std::cout << prompt << " [" << (cur?"true":"false") << "]: "; std::string l; std::getline(std::cin,l); l=trim(l); return l.empty()?cur:parse_bool(l); }

StreamConfig run_console_interface() {
    StreamConfig cfg;
    std::cout << "=============================================\nFast UDP Streamer for FPGA Ethernet Testing\n=============================================\n\n";
    std::cout << "Payload source:\n  1 = text file with 16-bit hex values\n  2 = sine wave\n  3 = ramp\n";
    int mode = ask_int("Choose payload source", 2); if (mode < 1 || mode > 3) throw std::runtime_error("Invalid payload mode"); cfg.payload_mode = PayloadMode(mode);
    std::cout << "\nEthernet / IP / UDP settings:\n";
    cfg.dst_mac=ask_string("Destination MAC", cfg.dst_mac); cfg.src_mac=ask_string("Source MAC", cfg.src_mac); cfg.src_ip=ask_string("Source IP", cfg.src_ip); cfg.dst_ip=ask_string("Destination IP", cfg.dst_ip); cfg.udp_src_port=ask_u16("UDP source port", cfg.udp_src_port); cfg.udp_dst_port=ask_u16("UDP destination port", cfg.udp_dst_port);
    std::cout << "\nPayload format:\n";
    cfg.num_channels=ask_int("Number of channels", cfg.num_channels); cfg.sample_big_endian=ask_bool("16-bit sample big-endian? false=little", cfg.sample_big_endian); cfg.sample_signed=ask_bool("Signed int16 samples? false=unsigned", cfg.sample_signed); cfg.max_udp_payload_bytes=ask_int("Maximum UDP payload bytes", cfg.max_udp_payload_bytes);
    if (cfg.payload_mode == PayloadMode::TextFileHex16) cfg.input_txt_file=ask_string("Input TXT file", cfg.input_txt_file);
    else if (cfg.payload_mode == PayloadMode::SineWave) { cfg.sine_freq_hz=ask_double("Sine frequency [Hz]", cfg.sine_freq_hz); cfg.sample_rate_hz=ask_double("Sample rate [S/s]", cfg.sample_rate_hz); cfg.amplitude_scale=ask_double("Amplitude scale 0..1", cfg.amplitude_scale); cfg.auto_sine_payload_packing=ask_bool("Auto sine payload packing?", cfg.auto_sine_payload_packing); if(!cfg.auto_sine_payload_packing) cfg.manual_samples_per_payload=ask_int("Manual samples per payload", cfg.manual_samples_per_payload); }
    else { cfg.ramp_start=ask_u16("Ramp start value", cfg.ramp_start); cfg.ramp_step=ask_u16("Ramp step", cfg.ramp_step); }
    std::cout << "\nRate / repeat settings:\n";
    cfg.target_payload_rate_bps=ask_double("Target PAYLOAD data rate [bps], 0=max", cfg.target_payload_rate_bps); cfg.continuous=ask_bool("Continuous send until Ctrl+C?", cfg.continuous); if(!cfg.continuous) cfg.repeat_count=ask_u64("Repeat count", cfg.repeat_count); cfg.high_precision_timing=ask_bool("High precision timing? higher CPU", cfg.high_precision_timing);
    std::cout << "\nAvailable Npcap adapters:\n"; for (const auto& a : list_adapters()) std::cout << "  " << a.index << ": " << a.description << "\n      " << a.name << "\n";
    return cfg;
}
