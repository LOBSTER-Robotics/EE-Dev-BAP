#pragma once
#include "Config.hpp"
#include <cstdint>
#include <fstream>
#include <vector>

class SampleDecoder24Lsb {
public:
    explicit SampleDecoder24Lsb(const RxConfig& cfg);
    void open_csv();
    void process_payload(const uint8_t* data, size_t size);
    void close_csv();
    uint64_t total_payload_bytes() const { return payload_bytes_; }
    uint64_t total_frames_written() const { return csv_rows_written_; }
private:
    int32_t decode24(const uint8_t* p) const;
    void push_sample(int32_t sample);
    void write_frame_if_needed();
    RxConfig cfg_;
    std::ofstream csv_;
    std::vector<uint8_t> byte_leftover_;
    std::vector<int32_t> current_frame_;
    uint64_t payload_bytes_ = 0;
    uint64_t frame_index_ = 0;
    uint64_t csv_rows_written_ = 0;
};
