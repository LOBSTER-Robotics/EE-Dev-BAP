from scapy.utils import PcapReader
import numpy as np
import matplotlib.pyplot as plt
from concurrent.futures import ThreadPoolExecutor
import os

PCAP_FILE = "C:\\Users\\hoona\\Documents\\test.pcapng"          # change to your Wireshark file
HEADER_BYTES = 42                # bytes to skip from full original packet
SAMPLE_RATE = None               # e.g. 48000, or leave None for sample index
ENDIAN = "little"                # "little" or "big"
SIGNED = True
MAX_WORKERS = 12


def int24_to_int32(payload: bytes, endian="little", signed=True):
    """
    Convert packed 24-bit samples into int32 NumPy array.
    Assumes 3 bytes per sample.
    """
    payload = payload[:len(payload) - (len(payload) % 3)]

    if len(payload) == 0:
        return np.array([], dtype=np.int32)

    b = np.frombuffer(payload, dtype=np.uint8).reshape(-1, 3)

    if endian == "little":
        values = (
            b[:, 0].astype(np.int32)
            | (b[:, 1].astype(np.int32) << 8)
            | (b[:, 2].astype(np.int32) << 16)
        )
    else:
        values = (
            b[:, 2].astype(np.int32)
            | (b[:, 1].astype(np.int32) << 8)
            | (b[:, 0].astype(np.int32) << 16)
        )

    if signed:
        values = (values ^ 0x800000) - 0x800000

    return values


def process_packet(frame: bytes):
    """
    Runs in a worker thread.
    frame is the full original packet from pkt.original.
    """
    payload = frame[HEADER_BYTES:]

    samples = int24_to_int32(
        payload,
        endian=ENDIAN,
        signed=SIGNED
    )

    if samples.size == 0:
        return None

    return samples


def packet_bytes_generator(pcap_file):
    """
    Reads the pcap sequentially.
    This part should not be multithreaded.
    """
    with PcapReader(pcap_file) as reader:
        for pkt in reader:
            yield bytes(pkt.original)


all_samples = []

with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
    # executor.map keeps the original packet order
    for samples in executor.map(process_packet, packet_bytes_generator(PCAP_FILE)):
        if samples is not None:
            all_samples.append(samples)


if not all_samples:
    raise RuntimeError("No 24-bit samples found. Check HEADER_BYTES and payload format.")

samples = np.concatenate(all_samples)
samples = samples[:1000]

if SIGNED:
    y = samples / (2**23)
else:
    y = samples / (2**24 - 1)

if SAMPLE_RATE:
    x = np.arange(len(y)) / SAMPLE_RATE
    xlabel = "Time (seconds)"
else:
    x = np.arange(len(y))
    xlabel = "Sample index"

plt.figure(figsize=(120, 5))
plt.plot(x, y)
plt.xlabel(xlabel)
plt.ylabel("Amplitude")
plt.title("24-bit data from Wireshark capture")
plt.grid(True)
plt.tight_layout()
plt.show()