#include "PacketParser.hpp"
#include "Utils.hpp"

#include <cstring>
#include <stdexcept>

static bool mac_matches_if_set(const std::string& expected, const uint8_t* actual) {
    if (expected.empty()) return true;
    auto mac = parse_mac(expected);
    return std::memcmp(mac.data(), actual, 6) == 0;
}

static bool ip_matches_if_set(const std::string& expected, const uint8_t* actual) {
    if (expected.empty()) return true;
    uint8_t ip[4];
    if (!ipv4_string_to_bytes(expected, ip)) throw std::runtime_error("Invalid expected IP: " + expected);
    return std::memcmp(ip, actual, 4) == 0;
}

bool extract_matching_udp_payload(const uint8_t* frame, size_t frame_len, const RxConfig& cfg, UdpPayloadView& out) {
    out = {};
    if (frame_len < 14) return false;

    const uint8_t* eth_dst = frame + 0;
    const uint8_t* eth_src = frame + 6;
    uint16_t eth_type = read_be16(frame + 12);

    if (!mac_matches_if_set(cfg.expected_dst_mac, eth_dst)) return false;
    if (!mac_matches_if_set(cfg.expected_src_mac, eth_src)) return false;
    if (eth_type != 0x0800) return false; // IPv4

    const size_t ip_offset = 14;
    if (frame_len < ip_offset + 20) return false;

    const uint8_t* ip = frame + ip_offset;
    uint8_t version = ip[0] >> 4;
    uint8_t ihl = ip[0] & 0x0F;
    if (version != 4 || ihl < 5) return false;

    size_t ip_header_len = static_cast<size_t>(ihl) * 4;
    if (frame_len < ip_offset + ip_header_len) return false;

    uint16_t ip_total_len = read_be16(ip + 2);
    if (ip_total_len < ip_header_len + 8) return false;
    if (frame_len < ip_offset + ip_total_len) return false;

    if (ip[9] != 17) return false; // UDP

    if (!ip_matches_if_set(cfg.expected_src_ip, ip + 12)) return false;
    if (!ip_matches_if_set(cfg.expected_dst_ip, ip + 16)) return false;

    const size_t udp_offset = ip_offset + ip_header_len;
    const uint8_t* udp = frame + udp_offset;
    uint16_t udp_src_port = read_be16(udp + 0);
    uint16_t udp_dst_port = read_be16(udp + 2);
    uint16_t udp_len = read_be16(udp + 4);

    if (udp_len < 8) return false;
    if (udp_offset + udp_len > frame_len) return false;
    if (cfg.expected_udp_src_port != 0 && udp_src_port != cfg.expected_udp_src_port) return false;
    if (cfg.expected_udp_dst_port != 0 && udp_dst_port != cfg.expected_udp_dst_port) return false;

    out.data = udp + 8;
    out.size = udp_len - 8;
    return true;
}
