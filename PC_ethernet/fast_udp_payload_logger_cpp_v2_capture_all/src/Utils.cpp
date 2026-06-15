#define NOMINMAX
#include "Utils.hpp"

#include <winsock2.h>
#include <ws2tcpip.h>

#include <algorithm>
#include <cctype>
#include <sstream>
#include <stdexcept>

std::string trim(const std::string& s) {
    size_t a = 0;
    while (a < s.size() && std::isspace(static_cast<unsigned char>(s[a]))) a++;
    size_t b = s.size();
    while (b > a && std::isspace(static_cast<unsigned char>(s[b - 1]))) b--;
    return s.substr(a, b - a);
}

bool parse_bool(const std::string& s) {
    std::string v = trim(s);
    std::transform(v.begin(), v.end(), v.begin(), [](unsigned char c){ return static_cast<char>(std::tolower(c)); });

    if (v == "1" || v == "true" || v == "yes" || v == "y" || v == "on") return true;
    if (v == "0" || v == "false" || v == "no" || v == "n" || v == "off") return false;

    throw std::runtime_error("Invalid bool: " + s);
}

uint16_t parse_u16(const std::string& s) {
    uint64_t v = std::stoull(trim(s), nullptr, 0);
    if (v > 0xFFFF) throw std::runtime_error("Value too large for uint16: " + s);
    return static_cast<uint16_t>(v);
}

uint64_t parse_u64(const std::string& s) {
    return static_cast<uint64_t>(std::stoull(trim(s), nullptr, 0));
}

std::vector<uint8_t> parse_mac(const std::string& mac) {
    std::vector<uint8_t> out;
    std::stringstream ss(mac);
    std::string item;

    while (std::getline(ss, item, ':')) {
        if (item.empty() || item.size() > 2) throw std::runtime_error("Invalid MAC: " + mac);
        uint32_t v = static_cast<uint32_t>(std::stoul(item, nullptr, 16));
        if (v > 0xFF) throw std::runtime_error("Invalid MAC byte: " + item);
        out.push_back(static_cast<uint8_t>(v));
    }

    if (out.size() != 6) throw std::runtime_error("Invalid MAC: " + mac);
    return out;
}

bool ipv4_string_to_bytes(const std::string& ip, uint8_t out[4]) {
    in_addr addr{};
    if (inet_pton(AF_INET, ip.c_str(), &addr) != 1) return false;

    const uint32_t net = addr.s_addr;
    out[0] = static_cast<uint8_t>(net & 0xFF);
    out[1] = static_cast<uint8_t>((net >> 8) & 0xFF);
    out[2] = static_cast<uint8_t>((net >> 16) & 0xFF);
    out[3] = static_cast<uint8_t>((net >> 24) & 0xFF);
    return true;
}

uint16_t read_be16(const uint8_t* p) {
    return static_cast<uint16_t>((static_cast<uint16_t>(p[0]) << 8) | p[1]);
}
