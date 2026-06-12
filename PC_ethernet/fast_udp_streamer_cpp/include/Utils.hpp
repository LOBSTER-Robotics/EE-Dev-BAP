#pragma once
#include <cstdint>
#include <string>
#include <vector>

uint16_t read_be16(const uint8_t* p);
void write_be16(uint8_t* p, uint16_t v);
void write_be32(uint8_t* p, uint32_t v);
uint16_t checksum16(const uint8_t* data, size_t len);
uint32_t ipv4_to_u32_host_order(const std::string& ip_str);
std::vector<uint8_t> parse_mac(const std::string& mac_str);
std::string trim(const std::string& s);
std::string lower_copy(std::string s);
bool parse_bool(const std::string& s);
uint64_t parse_u64(const std::string& s);
uint16_t parse_u16(const std::string& s);
double parse_double(const std::string& s);
