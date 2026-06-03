"""
Generate GUI-compatible TXT payloads containing 16-bit sine-wave samples.

The TXT output is meant for the Tkinter GUI we made earlier.

Each output line has this format:

    hex:00 00 12 34 ...

Your GUI parses "hex:" lines as raw bytes, so each line becomes one UDP payload
when using "List of packets" mode.

Important constraint:
    1440 bytes / 2 bytes per sample / 16 channels = 45 time samples per payload.

At:
    SAMPLE_RATE_HZ = 2_000_000
    SINE_FREQ_HZ   = 10_000

one full sine wave needs:
    2_000_000 / 10_000 = 200 time samples

That is:
    200 * 16 * 2 = 6400 bytes

So a full 10 kHz period at 2 MS/s does NOT fit in one 1440-byte payload.
Use OUTPUT_MODE = "multi_payload" for exact 10 kHz, or use
OUTPUT_MODE = "one_payload_adjust_frequency" for one repeatable payload.
"""

import math
from pathlib import Path


# ============================================================
# Easy-to-change settings
# ============================================================

SINE_FREQ_HZ = 10_000
SAMPLE_RATE_HZ = 2_000_000

NUM_CHANNELS = 16
BITS_PER_SAMPLE = 16
MAX_PAYLOAD_BYTES = 1440

# "big" or "little"
ENDIANNESS = "big"

# "signed" gives int16 two's-complement values: -32768 to +32767
# "unsigned" gives offset-binary values: 0 to 65535, center at 32768
SAMPLE_FORMAT = "unsigned"

# Amplitude scale from 0.0 to 1.0
# 1.0 gives almost full-scale sine.
AMPLITUDE_SCALE = 0.95

# Output modes:
#
# "multi_payload"
#   Keeps SINE_FREQ_HZ exact.
#   Generates one complete sine period and splits it over multiple TXT lines.
#
# "one_payload_adjust_frequency"
#   Generates exactly one payload with 45 time samples.
#   The actual sine frequency becomes SAMPLE_RATE_HZ / 45.
#   At 2 MS/s, that is 44.444 kHz.
#
# "one_payload_strict"
#   Requires the requested frequency to fit exactly in one payload.
#   For 10 kHz at 2 MS/s this will raise an error.
OUTPUT_MODE = "multi_payload"

OUTPUT_TXT_FILE = "sine_payloads.txt"


# ============================================================
# Helper functions
# ============================================================

def samples_per_payload() -> int:
    bytes_per_sample = BITS_PER_SAMPLE // 8
    return MAX_PAYLOAD_BYTES // (NUM_CHANNELS * bytes_per_sample)


def int16_to_bytes(value: int, endianness: str, sample_format: str) -> bytes:
    if endianness not in ("big", "little"):
        raise ValueError("ENDIANNESS must be 'big' or 'little'")

    if sample_format == "signed":
        if value < -32768 or value > 32767:
            raise ValueError(f"Signed int16 value out of range: {value}")
        return value.to_bytes(2, byteorder=endianness, signed=True)

    if sample_format == "unsigned":
        if value < 0 or value > 65535:
            raise ValueError(f"Unsigned uint16 value out of range: {value}")
        return value.to_bytes(2, byteorder=endianness, signed=False)

    raise ValueError("SAMPLE_FORMAT must be 'signed' or 'unsigned'")


def sine_sample(sample_index: int, total_period_samples: int) -> int:
    """
    Generate one sine sample.

    sample_index = 0 starts at sin(0) = 0.
    sample_index = total_period_samples - 1 stops just before the end of the wave.
    """

    angle = 2.0 * math.pi * sample_index / total_period_samples
    s = math.sin(angle)

    if SAMPLE_FORMAT == "signed":
        amplitude = int(32767 * AMPLITUDE_SCALE)
        return int(round(amplitude * s))

    if SAMPLE_FORMAT == "unsigned":
        amplitude = int(32767 * AMPLITUDE_SCALE)
        return int(round(32768 + amplitude * s))

    raise ValueError("SAMPLE_FORMAT must be 'signed' or 'unsigned'")


def make_interleaved_payload(start_sample: int, sample_count: int, period_samples: int) -> bytes:
    """
    Make one payload.

    Byte order inside the payload is:

        sample 0 channel 0 high/low byte
        sample 0 channel 1 high/low byte
        ...
        sample 0 channel 15 high/low byte
        sample 1 channel 0 high/low byte
        ...

    All 16 channels currently get the same sine sample.
    """

    payload = bytearray()

    for n in range(start_sample, start_sample + sample_count):
        value = sine_sample(n % period_samples, period_samples)

        for _channel in range(NUM_CHANNELS):
            payload.extend(int16_to_bytes(value, ENDIANNESS, SAMPLE_FORMAT))

    return bytes(payload)


def bytes_to_gui_hex_line(payload: bytes) -> str:
    return "hex:" + payload.hex(" ")


def write_payloads_to_txt(payloads: list[bytes], output_file: str | Path) -> None:
    output_file = Path(output_file)

    with output_file.open("w", encoding="utf-8") as f:
        for payload in payloads:
            f.write(bytes_to_gui_hex_line(payload))
            f.write("\n")


def generate_payloads() -> tuple[list[bytes], dict]:
    max_samples = samples_per_payload()

    if BITS_PER_SAMPLE != 16:
        raise ValueError("This script currently expects BITS_PER_SAMPLE = 16")

    exact_period_samples = SAMPLE_RATE_HZ / SINE_FREQ_HZ
    rounded_period_samples = int(round(exact_period_samples))

    if abs(exact_period_samples - rounded_period_samples) > 1e-9:
        raise ValueError(
            f"SAMPLE_RATE_HZ / SINE_FREQ_HZ must be an integer for a perfectly repeatable wave. "
            f"Got {exact_period_samples}."
        )

    if OUTPUT_MODE == "multi_payload":
        period_samples = rounded_period_samples
        payloads = []

        for start in range(0, period_samples, max_samples):
            count = min(max_samples, period_samples - start)
            payloads.append(make_interleaved_payload(start, count, period_samples))

        info = {
            "mode": OUTPUT_MODE,
            "requested_frequency_hz": SINE_FREQ_HZ,
            "actual_frequency_hz": SINE_FREQ_HZ,
            "sample_rate_hz": SAMPLE_RATE_HZ,
            "period_samples": period_samples,
            "samples_per_payload": max_samples,
            "payload_count": len(payloads),
            "payload_sizes_bytes": [len(p) for p in payloads],
        }

        return payloads, info

    if OUTPUT_MODE == "one_payload_adjust_frequency":
        period_samples = max_samples
        actual_frequency = SAMPLE_RATE_HZ / period_samples
        payload = make_interleaved_payload(0, period_samples, period_samples)

        info = {
            "mode": OUTPUT_MODE,
            "requested_frequency_hz": SINE_FREQ_HZ,
            "actual_frequency_hz": actual_frequency,
            "sample_rate_hz": SAMPLE_RATE_HZ,
            "period_samples": period_samples,
            "samples_per_payload": max_samples,
            "payload_count": 1,
            "payload_sizes_bytes": [len(payload)],
        }

        return [payload], info

    if OUTPUT_MODE == "one_payload_strict":
        period_samples = rounded_period_samples

        if period_samples > max_samples:
            raise ValueError(
                f"Requested sine wave does not fit in one payload.\n"
                f"Requested period samples: {period_samples}\n"
                f"Max samples per payload:  {max_samples}\n"
                f"Required bytes:           {period_samples * NUM_CHANNELS * 2}\n"
                f"Max payload bytes:        {MAX_PAYLOAD_BYTES}\n\n"
                f"For one-payload repeat at {SAMPLE_RATE_HZ} S/s, use frequency "
                f"{SAMPLE_RATE_HZ / max_samples:.6f} Hz, or lower the sample rate to "
                f"{SINE_FREQ_HZ * max_samples} S/s."
            )

        payload = make_interleaved_payload(0, period_samples, period_samples)

        info = {
            "mode": OUTPUT_MODE,
            "requested_frequency_hz": SINE_FREQ_HZ,
            "actual_frequency_hz": SINE_FREQ_HZ,
            "sample_rate_hz": SAMPLE_RATE_HZ,
            "period_samples": period_samples,
            "samples_per_payload": max_samples,
            "payload_count": 1,
            "payload_sizes_bytes": [len(payload)],
        }

        return [payload], info

    raise ValueError(
        "OUTPUT_MODE must be 'multi_payload', 'one_payload_adjust_frequency', or 'one_payload_strict'"
    )


def main() -> None:
    payloads, info = generate_payloads()
    write_payloads_to_txt(payloads, OUTPUT_TXT_FILE)

    print("Generated:", OUTPUT_TXT_FILE)
    print()
    print("Settings/result:")
    for key, value in info.items():
        print(f"  {key}: {value}")

    print()
    print("GUI usage:")
    print("  1. Open ethernetSenderGUI_txt.py")
    print("  2. Click 'Load .txt into payload box'")
    print(f"  3. Select '{OUTPUT_TXT_FILE}'")
    print("  4. Use 'List of packets' mode if the file has multiple lines")
    print("  5. Click 'Send payload box'")
    print()
    print("Alternative:")
    print("  Use 'Send .txt file directly' with 'each line as a packet'.")


if __name__ == "__main__":
    main()
