#include "PacketParser.hpp"
#include "Utils.hpp"

#include <algorithm>
#include <cstring>
#include <stdexcept>

static bool mac_match(const std::string& expected, const uint8_t* actual) {
    if (expected.empty()) return true;
    auto mac = parse_mac(expected);
    return std::memcmp(mac.data(), actual, 6) == 0;
}

static bool ip_match(const std::string& expected, const uint8_t* actual) {
    if (expected.empty()) return true;

    uint8_t ip[4];
    if (!ipv4_string_to_bytes(expected, ip)) {
        throw std::runtime_error("Invalid IP: " + expected);
    }

    return std::memcmp(ip, actual, 4) == 0;
}

bool extract_payload(
    const uint8_t* frame,
    size_t frame_len,
    const LoggerConfig& cfg,
    PayloadView& payload
) {
    payload = {};

    if (frame_len < 14) return false;

    const uint8_t* eth_dst = frame + 0;
    const uint8_t* eth_src = frame + 6;
    uint16_t eth_type = read_be16(frame + 12);

    if (!mac_match(cfg.expected_dst_mac, eth_dst)) return false;
    if (!mac_match(cfg.expected_src_mac, eth_src)) return false;
    if (eth_type != 0x0800) return false;

    const size_t ip_off = 14;
    if (frame_len < ip_off + 20) return false;

    const uint8_t* ip = frame + ip_off;
    uint8_t version = ip[0] >> 4;
    uint8_t ihl = ip[0] & 0x0F;

    if (version != 4 || ihl < 5) return false;

    size_t ip_header_len = static_cast<size_t>(ihl) * 4;
    if (frame_len < ip_off + ip_header_len) return false;

    uint16_t ip_total_len = read_be16(ip + 2);
    if (ip_total_len < ip_header_len + 8) return false;

    // For malformed/debug frames, the captured frame can be longer than the IP total length.
    // In strict normal networking, only ip_total_len is part of the IP packet.
    size_t ip_packet_end = ip_off + static_cast<size_t>(ip_total_len);
    if (frame_len < ip_packet_end) return false;

    if (ip[9] != 17) return false;

    if (!ip_match(cfg.expected_src_ip, ip + 12)) return false;
    if (!ip_match(cfg.expected_dst_ip, ip + 16)) return false;

    const size_t udp_off = ip_off + ip_header_len;
    if (frame_len < udp_off + 8) return false;

    const uint8_t* udp = frame + udp_off;

    uint16_t sport = read_be16(udp + 0);
    uint16_t dport = read_be16(udp + 2);
    uint16_t udp_len = read_be16(udp + 4);

    if (udp_len < 8) return false;

    if (cfg.expected_udp_src_port != 0 && sport != cfg.expected_udp_src_port) return false;
    if (cfg.expected_udp_dst_port != 0 && dport != cfg.expected_udp_dst_port) return false;

    const size_t payload_off = udp_off + 8;

    payload.data = frame + payload_off;
    payload.udp_reported_payload_size = static_cast<uint16_t>(udp_len - 8);
    payload.captured_after_udp_header_size = (frame_len > payload_off) ? (frame_len - payload_off) : 0;
    payload.ip_after_udp_header_size = (ip_packet_end > payload_off) ? (ip_packet_end - payload_off) : 0;

    switch (cfg.payload_length_mode) {
    case PayloadLengthMode::StrictUdpLength:
        if (payload_off + udp_len - 8 > frame_len) return false;
        payload.size = udp_len - 8;
        break;

    case PayloadLengthMode::RestOfCapturedFrame:
        payload.size = payload.captured_after_udp_header_size;
        break;

    case PayloadLengthMode::RestOfIpPacket:
        payload.size = payload.ip_after_udp_header_size;
        break;

    default:
        return false;
    }

    return payload.size > 0;
}
