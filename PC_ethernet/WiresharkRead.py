from scapy.utils import PcapReader
from scapy.layers.inet import UDP
from scapy.packet import Raw
import numpy as np
import matplotlib.pyplot as plt

PCAP_FILE = "C:\\Users\\hoona\\Documents\\test.pcapng"     # change to your Wireshark file
UDP_PORT = None                  # set to your port, e.g. 5000, or leave None
HEADER_BYTES = 44                # skip protocol header bytes inside UDP payload
SAMPLE_RATE = None               # e.g. 48000, or leave None for sample index
ENDIAN = "little"                # "little" or "big"
SIGNED = True                    # most 24-bit ADC/audio data is signed


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
        # Sign-extend 24-bit two's-complement to int32
        values = (values ^ 0x800000) - 0x800000

    return values


all_samples = []

reader = PcapReader(PCAP_FILE)

try:
    for pkt in reader:

        payload = bytes(pkt.original)

        # Skip custom protocol/header bytes before the 24-bit samples
        payload = payload[HEADER_BYTES:]

        samples = int24_to_int32(
            payload,
            endian=ENDIAN,
            signed=SIGNED
        )

        if samples.size:
            all_samples.append(samples)

finally:
    reader.close()


if not all_samples:
    raise RuntimeError("No 24-bit samples found. Check UDP_PORT, HEADER_BYTES, and payload format.")

samples = np.concatenate(all_samples)

# Normalize 24-bit signed samples to roughly -1.0 to +1.0
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

plt.figure(figsize=(12, 5))
plt.plot(x, y)
plt.xlabel(xlabel)
plt.ylabel("Amplitude")
plt.title("24-bit payload data from Wireshark capture")
plt.grid(True)
plt.tight_layout()
plt.show()