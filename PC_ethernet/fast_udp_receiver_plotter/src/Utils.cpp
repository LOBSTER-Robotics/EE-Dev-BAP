#define NOMINMAX
#include "Utils.hpp"

#include <winsock2.h>
#include <ws2tcpip.h>

#include <algorithm>
#include <cctype>
#include <iomanip>
#include <sstream>
#include <stdexcept>

std::string trim(const std::string& s) {
    size_t first = 0;
    while (first < s.size() && std::isspace(static_cast<unsigned char>(s[first]))) first++;

    size_t last = s.size();
    while (last > first && std::isspace(static_cast<unsigned char>(s[last - 1]))) last--;

    return s.substr(first, last - first);
}

std::string lower_copy(std::string s) {
    std::transform(s.begin(), s.end(), s.begin(),
        [](unsigned char c) { return static_cast<char>(std::tolower(c)); });
    return s;
}

bool parse_bool(const std::string& s) {
    std::string v = lower_copy(trim(s));
    if (v == "1" || v == "true" || v == "yes" || v == "y" || v == "on") return true;
    if (v == "0" || v == "false" || v == "no" || v == "n" || v == "off") return false;
    throw std::runtime_error("Invalid boolean value: " + s);
}

uint16_t parse_u16(const std::string& s) {
    uint64_t v = std::stoull(trim(s), nullptr, 0);
    if (v > 0xFFFF) throw std::runtime_error("Value too large for uint16: " + s);
    return static_cast<uint16_t>(v);
}

uint64_t parse_u64(const std::string& s) {
    return static_cast<uint64_t>(std::stoull(trim(s), nullptr, 0));
}

std::vector<uint8_t> parse_mac(const std::string& mac_str) {
    std::vector<uint8_t> mac;
    std::stringstream ss(mac_str);
    std::string item;

    while (std::getline(ss, item, ':')) {
        if (item.empty() || item.size() > 2) throw std::runtime_error("Invalid MAC: " + mac_str);
        uint32_t v = static_cast<uint32_t>(std::stoul(item, nullptr, 16));
        if (v > 0xFF) throw std::runtime_error("Invalid MAC byte: " + item);
        mac.push_back(static_cast<uint8_t>(v));
    }

    if (mac.size() != 6) throw std::runtime_error("Invalid MAC: " + mac_str);
    return mac;
}

std::string mac_to_string(const uint8_t* p) {
    std::ostringstream os;
    os << std::hex << std::setfill('0');
    for (int i = 0; i < 6; i++) {
        if (i) os << ":";
        os << std::setw(2) << static_cast<int>(p[i]);
    }
    return os.str();
}

uint16_t read_be16(const uint8_t* p) {
    return static_cast<uint16_t>((p[0] << 8) | p[1]);
}

uint32_t read_be32(const uint8_t* p) {
    return (static_cast<uint32_t>(p[0]) << 24) |
           (static_cast<uint32_t>(p[1]) << 16) |
           (static_cast<uint32_t>(p[2]) << 8) |
           (static_cast<uint32_t>(p[3]));
}

bool ipv4_string_to_bytes(const std::string& ip, uint8_t out[4]) {
    in_addr addr{};
    if (inet_pton(AF_INET, ip.c_str(), &addr) != 1) return false;
    uint8_t* p = reinterpret_cast<uint8_t*>(&addr.s_addr);
    out[0] = p[0]; out[1] = p[1]; out[2] = p[2]; out[3] = p[3];
    return true;
}

std::string ipv4_to_string(const uint8_t* p) {
    std::ostringstream os;
    os << static_cast<int>(p[0]) << "." << static_cast<int>(p[1]) << "." << static_cast<int>(p[2]) << "." << static_cast<int>(p[3]);
    return os.str();
}
