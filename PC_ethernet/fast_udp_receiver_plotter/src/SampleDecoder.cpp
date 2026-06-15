#include "SampleDecoder.hpp"
#include <filesystem>
#include <stdexcept>

SampleDecoder24Lsb::SampleDecoder24Lsb(const RxConfig& cfg) : cfg_(cfg) {
    if (cfg_.num_channels <= 0) throw std::runtime_error("num_channels must be > 0");
    if (cfg_.csv_decimation == 0) throw std::runtime_error("csv_decimation must be >= 1");
    current_frame_.reserve(static_cast<size_t>(cfg_.num_channels));
}

void SampleDecoder24Lsb::open_csv() {
    std::filesystem::path p(cfg_.csv_file);
    if (!p.parent_path().empty()) std::filesystem::create_directories(p.parent_path());
    csv_.open(cfg_.csv_file, std::ios::out | std::ios::trunc);
    if (!csv_) throw std::runtime_error("Could not open CSV file: " + cfg_.csv_file);
    csv_ << "frame";
    for (int ch = 0; ch < cfg_.num_channels; ++ch) csv_ << ",ch" << ch;
    csv_ << "\n";
}

void SampleDecoder24Lsb::close_csv() {
    if (csv_) { csv_.flush(); csv_.close(); }
}

int32_t SampleDecoder24Lsb::decode24(const uint8_t* p) const {
    uint32_t u = static_cast<uint32_t>(p[0]) |
                 (static_cast<uint32_t>(p[1]) << 8) |
                 (static_cast<uint32_t>(p[2]) << 16);
    if (cfg_.sample_signed && (u & 0x800000u)) u |= 0xFF000000u;
    return static_cast<int32_t>(u);
}

void SampleDecoder24Lsb::push_sample(int32_t sample) {
    current_frame_.push_back(sample);
    if (current_frame_.size() == static_cast<size_t>(cfg_.num_channels)) {
        write_frame_if_needed();
        current_frame_.clear();
        ++frame_index_;
    }
}

void SampleDecoder24Lsb::write_frame_if_needed() {
    if ((frame_index_ % cfg_.csv_decimation) != 0) return;
    csv_ << frame_index_;
    for (int32_t v : current_frame_) csv_ << "," << v;
    csv_ << "\n";
    ++csv_rows_written_;
    if ((csv_rows_written_ % 1000) == 0) csv_.flush();
}

void SampleDecoder24Lsb::process_payload(const uint8_t* data, size_t size) {
    payload_bytes_ += size;
    std::vector<uint8_t> bytes;
    bytes.reserve(byte_leftover_.size() + size);
    bytes.insert(bytes.end(), byte_leftover_.begin(), byte_leftover_.end());
    bytes.insert(bytes.end(), data, data + size);

    size_t i = 0;
    while (i + 2 < bytes.size()) {
        push_sample(decode24(&bytes[i]));
        i += 3;
    }
    byte_leftover_.assign(bytes.begin() + i, bytes.end());
}
