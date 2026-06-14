#pragma once
#include <cstdint>
#include <string>
#include <vector>
std::string trim(const std::string& s);
bool parse_bool(const std::string& s);
uint16_t parse_u16(const std::string& s);
uint64_t parse_u64(const std::string& s);
std::vector<uint8_t> parse_mac(const std::string& mac);
bool ipv4_string_to_bytes(const std::string& ip, uint8_t out[4]);
uint16_t read_be16(const uint8_t* p);
