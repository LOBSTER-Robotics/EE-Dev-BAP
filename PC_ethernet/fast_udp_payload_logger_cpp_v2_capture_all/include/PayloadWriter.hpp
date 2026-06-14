#pragma once
#include "Config.hpp"
#include <cstdint>
#include <fstream>
#include <vector>

class PayloadWriter {
public:
    explicit PayloadWriter(const LoggerConfig& cfg);

    void open();
    void write_payload(const uint8_t* data, size_t size);
    void flush();
    void close();

    uint64_t payload_bytes_written() const { return payload_bytes_written_; }
    uint64_t payloads_written() const { return payloads_written_; }
    uint64_t decoded_csv_rows() const { return decoded_csv_rows_; }

private:
    int32_t decode24_lsb(const uint8_t* p) const;
    void write_hex_payload(const uint8_t* data, size_t size);
    void write_decoded24_csv(const uint8_t* data, size_t size);

    LoggerConfig cfg_;
    std::ofstream file_;
    std::vector<uint8_t> leftover_;
    std::vector<int32_t> frame_;

    uint64_t payloads_written_ = 0;
    uint64_t payload_bytes_written_ = 0;
    uint64_t frame_index_ = 0;
    uint64_t decoded_csv_rows_ = 0;
};
