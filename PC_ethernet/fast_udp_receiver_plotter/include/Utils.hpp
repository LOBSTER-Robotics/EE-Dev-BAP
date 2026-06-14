#pragma once
#include <cstdint>
#include <string>
#include <vector>

std::string trim(const std::string& s);
std::string lower_copy(std::string s);
bool parse_bool(const std::string& s);
uint16_t parse_u16(const std::string& s);
uint64_t parse_u64(const std::string& s);

std::vector<uint8_t> parse_mac(const std::string& mac_str);
std::string mac_to_string(const uint8_t* p);

uint16_t read_be16(const uint8_t* p);
uint32_t read_be32(const uint8_t* p);

bool ipv4_string_to_bytes(const std::string& ip, uint8_t out[4]);
std::string ipv4_to_string(const uint8_t* p);
