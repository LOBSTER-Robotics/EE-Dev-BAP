#include "ConsoleUI.hpp"
#include "NpcapReceiver.hpp"
#include "Utils.hpp"
#include <iostream>
#include <string>

static std::string ask_string(const std::string& prompt, const std::string& current) {
    std::cout << prompt << " [" << (current.empty() ? "disabled" : current) << "]: ";
    std::string line; std::getline(std::cin, line); line = trim(line); return line.empty() ? current : line;
}
static int ask_int(const std::string& prompt, int current) {
    std::cout << prompt << " [" << current << "]: "; std::string line; std::getline(std::cin, line); line = trim(line); return line.empty() ? current : std::stoi(line);
}
static uint16_t ask_u16(const std::string& prompt, uint16_t current) {
    std::cout << prompt << " [" << current << ", 0=disabled]: "; std::string line; std::getline(std::cin, line); line = trim(line); return line.empty() ? current : parse_u16(line);
}
static uint64_t ask_u64(const std::string& prompt, uint64_t current) {
    std::cout << prompt << " [" << current << "]: "; std::string line; std::getline(std::cin, line); line = trim(line); return line.empty() ? current : parse_u64(line);
}
static bool ask_bool(const std::string& prompt, bool current) {
    std::cout << prompt << " [" << (current ? "true" : "false") << "]: "; std::string line; std::getline(std::cin, line); line = trim(line); return line.empty() ? current : parse_bool(line);
}

int run_console_interface(RxConfig& cfg) {
    std::cout << "=============================================\nFast UDP Receiver + 24-bit LSB CSV Plot Feed\n=============================================\n\n";
    std::cout << "Filters. Leave empty to keep disabled.\n";
    cfg.expected_dst_mac = ask_string("Expected destination MAC", cfg.expected_dst_mac);
    cfg.expected_src_mac = ask_string("Expected source MAC", cfg.expected_src_mac);
    cfg.expected_src_ip = ask_string("Expected source IP", cfg.expected_src_ip);
    cfg.expected_dst_ip = ask_string("Expected destination IP", cfg.expected_dst_ip);
    cfg.expected_udp_src_port = ask_u16("Expected UDP source port", cfg.expected_udp_src_port);
    cfg.expected_udp_dst_port = ask_u16("Expected UDP destination port", cfg.expected_udp_dst_port);
    std::cout << "\n24-bit sample decoding:\n";
    cfg.sample_signed = ask_bool("Signed 24-bit samples?", cfg.sample_signed);
    cfg.num_channels = ask_int("Number of channels", cfg.num_channels);
    std::cout << "\nCSV output:\n";
    cfg.csv_file = ask_string("CSV output file", cfg.csv_file);
    cfg.csv_decimation = ask_u64("CSV decimation, write every Nth frame", cfg.csv_decimation);
    cfg.max_csv_rows = ask_u64("Maximum CSV rows, 0=continuous", cfg.max_csv_rows);
    cfg.verbose = ask_bool("Verbose?", cfg.verbose);
    std::cout << "\nAvailable Npcap adapters:\n";
    auto adapters = list_adapters();
    for (const auto& a : adapters) std::cout << "  " << a.index << ": " << a.description << "\n      " << a.name << "\n";
    return ask_int("\nChoose adapter number", 1);
}
