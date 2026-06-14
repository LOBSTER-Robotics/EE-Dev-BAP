"""
Plot raw 24-bit NORMAL byte order / big-endian samples from payload.bin.

Change the variables in the SETTINGS section below.

Byte order:
    FF EE DD -> 0xFFEEDD

START_POSITION selects the first frame/sample shown.
WAVE_LENGTH selects how many frames/samples are shown.
"""

from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt

# ============================================================
# SETTINGS - change these variables
# ============================================================

INPUT_FILE = "output/payload.bin"

# Number of interleaved channels in the payload stream.
NUM_CHANNELS = 1

# Channels to plot. Examples:
#   [0]
#   [0, 1, 2, 3]
#   "all"
CHANNELS_TO_PLOT = [0]

# Start frame/sample position in the captured waveform.
START_POSITION = 0

# Number of frames/samples to display.
WAVE_LENGTH = 2000

# True for signed 24-bit two's-complement, False for unsigned 24-bit.
SIGNED_24BIT = True

# Optional decimation for very large captures. 1 = plot every frame.
PLOT_DECIMATION = 1

# Save a PNG next to the input file.
SAVE_PNG = True
OUTPUT_PNG = "output/payload_plot.png"

# ============================================================


def decode_24_be(data: bytes, signed: bool) -> np.ndarray:
    n = (len(data) // 3) * 3
    if n == 0:
        return np.empty(0, dtype=np.int32)

    b = np.frombuffer(data[:n], dtype=np.uint8).reshape(-1, 3)

    v = (
        (b[:, 0].astype(np.uint32) << 16)
        | (b[:, 1].astype(np.uint32) << 8)
        | b[:, 2].astype(np.uint32)
    )

    if signed:
        v = np.where((v & 0x800000) != 0, v | 0xFF000000, v)

    return v.astype(np.int32)


def main():
    path = Path(INPUT_FILE)
    data = path.read_bytes()

    samples = decode_24_be(data, signed=SIGNED_24BIT)

    frame_count = len(samples) // NUM_CHANNELS
    if frame_count == 0:
        raise RuntimeError("No complete frames found. Check INPUT_FILE and NUM_CHANNELS.")

    frames = samples[:frame_count * NUM_CHANNELS].reshape(frame_count, NUM_CHANNELS)

    start = max(0, int(START_POSITION))
    end = min(frame_count, start + int(WAVE_LENGTH))

    if start >= frame_count:
        raise RuntimeError(f"START_POSITION {START_POSITION} is beyond frame count {frame_count}.")

    window = frames[start:end:PLOT_DECIMATION]
    x = np.arange(start, end, PLOT_DECIMATION)

    if CHANNELS_TO_PLOT == "all":
        channels = list(range(NUM_CHANNELS))
    else:
        channels = list(CHANNELS_TO_PLOT)

    print("Input file:", path)
    print("Input bytes:", len(data))
    print("Total 24-bit samples:", len(samples))
    print("Total frames:", frame_count)
    print("Plot start:", start)
    print("Plot end:", end)
    print("Channels:", channels)

    plt.figure(figsize=(12, 6))

    for ch in channels:
        if ch < 0 or ch >= NUM_CHANNELS:
            raise ValueError(f"Invalid channel {ch}; NUM_CHANNELS={NUM_CHANNELS}")
        plt.plot(x, window[:, ch], label=f"CH{ch}")

    plt.title(f"24-bit big-endian payload samples: frames {start} to {end}")
    plt.xlabel("Frame index")
    plt.ylabel("Sample value")
    plt.grid(True)
    plt.legend()
    plt.tight_layout()

    if SAVE_PNG:
        out = Path(OUTPUT_PNG)
        out.parent.mkdir(parents=True, exist_ok=True)
        plt.savefig(out, dpi=150)
        print("Saved plot:", out)

    plt.show()


if __name__ == "__main__":
    main()
