#include "PacketBuilder.hpp"
#include "Utils.hpp"
#include <cstring>
#include <stdexcept>

std::vector<uint8_t> build_udp_packet(const StreamConfig& cfg, const std::vector<uint8_t>& udp_payload) {
    const size_t eth_len = 14, ip_len = 20, udp_len = 8;
    if (udp_payload.size() > 65507) throw std::runtime_error("UDP payload too large");
    std::vector<uint8_t> pkt(eth_len + ip_len + udp_len + udp_payload.size(), 0);
    auto dst_mac = parse_mac(cfg.dst_mac); auto src_mac = parse_mac(cfg.src_mac);
    std::memcpy(&pkt[0], dst_mac.data(), 6); std::memcpy(&pkt[6], src_mac.data(), 6); write_be16(&pkt[12], 0x0800);
    size_t ip = eth_len;
    pkt[ip+0] = 0x45; pkt[ip+1] = 0x00;
    write_be16(&pkt[ip+2], uint16_t(ip_len + udp_len + udp_payload.size()));
    write_be16(&pkt[ip+4], 0x0000); write_be16(&pkt[ip+6], 0x0000);
    pkt[ip+8] = 64; pkt[ip+9] = 17; write_be16(&pkt[ip+10], 0x0000);
    write_be32(&pkt[ip+12], ipv4_to_u32_host_order(cfg.src_ip));
    write_be32(&pkt[ip+16], ipv4_to_u32_host_order(cfg.dst_ip));
    write_be16(&pkt[ip+10], checksum16(&pkt[ip], ip_len));
    size_t udp = eth_len + ip_len;
    write_be16(&pkt[udp+0], cfg.udp_src_port); write_be16(&pkt[udp+2], cfg.udp_dst_port);
    write_be16(&pkt[udp+4], uint16_t(udp_len + udp_payload.size()));
    write_be16(&pkt[udp+6], 0x0000); // UDP checksum disabled for IPv4
    std::memcpy(&pkt[udp+udp_len], udp_payload.data(), udp_payload.size());
    return pkt;
}
