#define NOMINMAX
#include "PayloadGenerator.hpp"
#include <algorithm>
#include <cmath>
#include <fstream>
#include <sstream>
#include <stdexcept>
#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

static void append_u16(std::vector<uint8_t>& p, uint16_t v, bool be) { if (be) { p.push_back(uint8_t(v>>8)); p.push_back(uint8_t(v)); } else { p.push_back(uint8_t(v)); p.push_back(uint8_t(v>>8)); } }
static uint16_t signed_to_u16(int32_t v) { return uint16_t(int16_t(v)); }
static void append_all_channels(std::vector<uint8_t>& p, uint16_t v, const StreamConfig& cfg) { for (int ch=0; ch<cfg.num_channels; ++ch) append_u16(p, v, cfg.sample_big_endian); }

static std::vector<std::vector<uint8_t>> samples_to_payloads(const std::vector<uint16_t>& samples, const StreamConfig& cfg, int samples_per_payload) {
    int bytes_per_frame = cfg.num_channels * 2;
    std::vector<std::vector<uint8_t>> out;
    for (size_t start=0; start<samples.size(); start += samples_per_payload) {
        size_t count = std::min<size_t>(samples_per_payload, samples.size()-start);
        std::vector<uint8_t> p; p.reserve(count * bytes_per_frame);
        for (size_t i=start; i<start+count; ++i) append_all_channels(p, samples[i], cfg);
        out.push_back(std::move(p));
    }
    return out;
}

static PayloadPattern text_file(const StreamConfig& cfg) {
    std::ifstream f(cfg.input_txt_file); if (!f) throw std::runtime_error("Could not open input file: " + cfg.input_txt_file);
    std::vector<uint16_t> words; std::string token;
    while (f >> token) {
        if (!token.empty() && token[0] == '#') { std::string dummy; std::getline(f, dummy); continue; }
        uint32_t v = uint32_t(std::stoul(token, nullptr, 16));
        if (v > 0xFFFF) throw std::runtime_error("Hex token > 16 bit: " + token);
        words.push_back(uint16_t(v));
    }
    if (words.empty()) throw std::runtime_error("Input text file contains no words");
    int spp = cfg.max_udp_payload_bytes / (cfg.num_channels * 2);
    if (spp <= 0) throw std::runtime_error("max_udp_payload_bytes too small");
    PayloadPattern out; out.payloads = samples_to_payloads(words, cfg, spp); out.description = "text-file hex16"; out.samples_per_payload = spp; return out;
}

static PayloadPattern sine(const StreamConfig& cfg) {
    int bytes_per_frame = cfg.num_channels * 2;
    int max_spp = cfg.max_udp_payload_bytes / bytes_per_frame;
    if (max_spp <= 0) throw std::runtime_error("max_udp_payload_bytes too small");
    double exact_spw = cfg.sample_rate_hz / cfg.sine_freq_hz;
    int spw = int(std::llround(exact_spw));
    if (std::abs(exact_spw - double(spw)) > 1e-9) throw std::runtime_error("sample_rate_hz / sine_freq_hz must be integer for repeatable sine");
    int spp = cfg.manual_samples_per_payload;
    int waves_per_payload = 0;
    int total_samples = spw;
    std::string desc;
    if (cfg.auto_sine_payload_packing) {
        waves_per_payload = max_spp / spw;
        if (waves_per_payload >= 1) { spp = waves_per_payload * spw; total_samples = spp; desc = "sine: multiple full waves per payload"; }
        else { spp = max_spp; total_samples = spw; desc = "sine: one wave split over multiple payloads"; }
    } else {
        if (spp <= 0 || spp > max_spp) throw std::runtime_error("manual_samples_per_payload invalid");
        desc = "sine: manual samples per payload";
    }
    std::vector<uint16_t> samples; samples.reserve(total_samples);
    for (int n=0; n<total_samples; ++n) {
        double angle = 2.0 * M_PI * double(n % spw) / double(spw);
        double s = std::sin(angle);
        uint16_t u;
        if (cfg.sample_signed) { int amp = int(32767.0 * cfg.amplitude_scale); u = signed_to_u16(int32_t(std::llround(amp * s))); }
        else { int amp = int(32767.0 * cfg.amplitude_scale); u = uint16_t(std::llround(32768.0 + amp * s)); }
        samples.push_back(u);
    }
    PayloadPattern out; out.payloads = samples_to_payloads(samples, cfg, spp); out.description = desc; out.actual_signal_rate_hz = cfg.sine_freq_hz; out.samples_per_wave = spw; out.samples_per_payload = spp; out.waves_per_payload = waves_per_payload; return out;
}

static PayloadPattern ramp(const StreamConfig& cfg) {
    int spp = cfg.max_udp_payload_bytes / (cfg.num_channels * 2); if (spp <= 0) throw std::runtime_error("max_udp_payload_bytes too small");
    std::vector<uint8_t> p; p.reserve(cfg.max_udp_payload_bytes);
    uint16_t v = cfg.ramp_start;
    for (int i=0; i<spp; ++i) { append_all_channels(p, v, cfg); v = uint16_t(v + cfg.ramp_step); }
    PayloadPattern out; out.payloads.push_back(std::move(p)); out.description = "ramp"; out.samples_per_payload = spp; return out;
}

PayloadPattern generate_payload_pattern(const StreamConfig& cfg) {
    switch(cfg.payload_mode) { case PayloadMode::TextFileHex16: return text_file(cfg); case PayloadMode::SineWave: return sine(cfg); case PayloadMode::Ramp: return ramp(cfg); default: throw std::runtime_error("Bad payload mode"); }
}
