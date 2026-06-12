#define NOMINMAX
#include "Utils.hpp"
#include <winsock2.h>
#include <ws2tcpip.h>
#include <algorithm>
#include <cctype>
#include <sstream>
#include <stdexcept>

uint16_t read_be16(const uint8_t* p) { return static_cast<uint16_t>((p[0] << 8) | p[1]); }
void write_be16(uint8_t* p, uint16_t v) { p[0] = static_cast<uint8_t>((v >> 8) & 0xFF); p[1] = static_cast<uint8_t>(v & 0xFF); }
void write_be32(uint8_t* p, uint32_t v) { p[0] = uint8_t((v >> 24) & 0xFF); p[1] = uint8_t((v >> 16) & 0xFF); p[2] = uint8_t((v >> 8) & 0xFF); p[3] = uint8_t(v & 0xFF); }

uint16_t checksum16(const uint8_t* data, size_t len) {
    uint32_t sum = 0;
    while (len > 1) { sum += read_be16(data); data += 2; len -= 2; }
    if (len > 0) sum += uint16_t(data[0] << 8);
    while (sum >> 16) sum = (sum & 0xFFFF) + (sum >> 16);
    return uint16_t(~sum);
}

uint32_t ipv4_to_u32_host_order(const std::string& ip_str) {
    in_addr addr{};
    if (inet_pton(AF_INET, ip_str.c_str(), &addr) != 1) throw std::runtime_error("Invalid IPv4 address: " + ip_str);
    return ntohl(addr.s_addr);
}

std::vector<uint8_t> parse_mac(const std::string& mac_str) {
    std::vector<uint8_t> mac; std::stringstream ss(mac_str); std::string item;
    while (std::getline(ss, item, ':')) {
        if (item.empty() || item.size() > 2) throw std::runtime_error("Invalid MAC address: " + mac_str);
        uint32_t value = uint32_t(std::stoul(item, nullptr, 16));
        if (value > 0xFF) throw std::runtime_error("Invalid MAC byte: " + item);
        mac.push_back(uint8_t(value));
    }
    if (mac.size() != 6) throw std::runtime_error("Invalid MAC address: " + mac_str);
    return mac;
}

std::string trim(const std::string& s) {
    size_t first = 0; while (first < s.size() && std::isspace((unsigned char)s[first])) ++first;
    size_t last = s.size(); while (last > first && std::isspace((unsigned char)s[last - 1])) --last;
    return s.substr(first, last - first);
}
std::string lower_copy(std::string s) { std::transform(s.begin(), s.end(), s.begin(), [](unsigned char c){ return char(std::tolower(c)); }); return s; }
bool parse_bool(const std::string& s) { auto v = lower_copy(trim(s)); if (v=="1"||v=="true"||v=="yes"||v=="y"||v=="on") return true; if (v=="0"||v=="false"||v=="no"||v=="n"||v=="off") return false; throw std::runtime_error("Invalid bool: " + s); }
uint64_t parse_u64(const std::string& s) { return uint64_t(std::stoull(trim(s), nullptr, 0)); }
uint16_t parse_u16(const std::string& s) { auto v = parse_u64(s); if (v > 0xFFFF) throw std::runtime_error("Value > uint16: " + s); return uint16_t(v); }
double parse_double(const std::string& s) { return std::stod(trim(s)); }
