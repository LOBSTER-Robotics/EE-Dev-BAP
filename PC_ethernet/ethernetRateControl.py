"""
Rate-controlled UDP packet sending for the FPGA FIFO.

This module calculates a safe Scapy sendp inter-packet delay based on:

    - UDP payload size(s)
    - number of packet-list repeats
    - FPGA FIFO size in bytes
    - FPGA FIFO drain/read rate in bytes per second
    - optional safety margin

It uses your existing normalize_payload() and ethernetSendPackets() functions.

Important:
    Scapy's inter timing is controlled by the OS and is not cycle-accurate,
    especially on Windows. Use a safety margin.
"""

from ethernetSendHelperFunctions import normalize_payload
from ethernetSendPackets import ethernetSendPackets


def payload_size_bytes(payload) -> int:
    """
    Returns the number of payload bytes after normalize_payload().
    """

    raw = normalize_payload(payload)

    if raw is None:
        raise ValueError(f"Invalid payload: {payload}")

    if not hasattr(raw, "load"):
        raise ValueError(f"Normalized payload has no .load field: {raw}")

    return len(bytes(raw.load))


def payload_sizes_bytes(payloads: list) -> list[int]:
    if not isinstance(payloads, list):
        raise TypeError("payloads must be a list")

    return [payload_size_bytes(payload) for payload in payloads]


def simulate_fifo_peak(
    packet_sizes: list[int],
    count: int,
    inter: float,
    fifo_drain_rate_bytes_s: float,
    initial_fifo_level_bytes: int = 0,
) -> float:
    """
    Simulate FIFO fill level.

    Packet timing model:
      - First packet arrives at t = 0
      - Next packets arrive every 'inter' seconds
      - Between packets, FIFO drains at fifo_drain_rate_bytes_s

    Returns:
      peak_fifo_level_bytes
    """

    if count < 1:
        raise ValueError("count must be >= 1")

    if inter < 0:
        raise ValueError("inter must be >= 0")

    if fifo_drain_rate_bytes_s < 0:
        raise ValueError("fifo_drain_rate_bytes_s must be >= 0")

    level = float(initial_fifo_level_bytes)
    peak = level

    for repeat_index in range(count):
        for packet_index, packet_size in enumerate(packet_sizes):
            is_first_packet = repeat_index == 0 and packet_index == 0

            if not is_first_packet:
                level -= fifo_drain_rate_bytes_s * inter
                if level < 0:
                    level = 0.0

            level += packet_size

            if level > peak:
                peak = level

    return peak


def calculate_safe_inter(
    packet_sizes: list[int],
    count: int,
    fifo_size_bytes: int,
    fifo_drain_rate_bytes_s: float,
    initial_fifo_level_bytes: int = 0,
    safety_margin_bytes: int = 0,
    min_inter: float = 0.0,
    max_inter: float = 1.0,
    resolution_s: float = 1e-6,
) -> float:
    """
    Calculate the minimum safe Scapy inter value in seconds.

    This works for fixed-size and variable-size packets.
    """

    if not packet_sizes:
        raise ValueError("packet_sizes is empty")

    if any(size <= 0 for size in packet_sizes):
        raise ValueError("All packet sizes must be > 0")

    if fifo_size_bytes <= 0:
        raise ValueError("fifo_size_bytes must be > 0")

    if safety_margin_bytes < 0:
        raise ValueError("safety_margin_bytes must be >= 0")

    fifo_limit = fifo_size_bytes - safety_margin_bytes

    if fifo_limit <= 0:
        raise ValueError("safety_margin_bytes is larger than or equal to fifo_size_bytes")

    if initial_fifo_level_bytes < 0:
        raise ValueError("initial_fifo_level_bytes must be >= 0")

    if initial_fifo_level_bytes >= fifo_limit:
        raise ValueError("Initial FIFO level is already above the safe FIFO limit")

    largest_packet = max(packet_sizes)

    if initial_fifo_level_bytes + largest_packet > fifo_limit:
        raise ValueError(
            "At least one packet is too large for the available FIFO space.\n"
            f"Largest packet:       {largest_packet} bytes\n"
            f"Initial FIFO level:   {initial_fifo_level_bytes} bytes\n"
            f"Safe FIFO limit:      {fifo_limit} bytes\n"
            f"Available space:      {fifo_limit - initial_fifo_level_bytes} bytes"
        )

    total_bytes = sum(packet_sizes) * count

    if fifo_drain_rate_bytes_s == 0:
        if initial_fifo_level_bytes + total_bytes <= fifo_limit:
            return 0.0

        raise ValueError(
            "FIFO drain rate is 0 bytes/s, so the FIFO cannot empty while sending.\n"
            f"Total burst bytes:    {total_bytes}\n"
            f"Available FIFO space: {fifo_limit - initial_fifo_level_bytes}"
        )

    def is_safe(test_inter: float) -> bool:
        peak = simulate_fifo_peak(
            packet_sizes=packet_sizes,
            count=count,
            inter=test_inter,
            fifo_drain_rate_bytes_s=fifo_drain_rate_bytes_s,
            initial_fifo_level_bytes=initial_fifo_level_bytes,
        )

        return peak <= fifo_limit

    if is_safe(min_inter):
        return min_inter

    low = min_inter
    high = max_inter

    while not is_safe(high):
        high *= 2.0

        if high > 60.0:
            raise ValueError(
                "Could not find a safe inter-packet delay below 60 seconds.\n"
                "Check fifo_drain_rate_bytes_s, fifo_size_bytes, and packet sizes."
            )

    while high - low > resolution_s:
        mid = (low + high) / 2.0

        if is_safe(mid):
            high = mid
        else:
            low = mid

    return high


def calculate_safe_inter_from_payloads(
    payloads: list,
    count: int,
    fifo_size_bytes: int,
    fifo_drain_rate_bytes_s: float,
    initial_fifo_level_bytes: int = 0,
    safety_margin_bytes: int = 0,
    resolution_s: float = 1e-6,
) -> float:
    sizes = payload_sizes_bytes(payloads)

    return calculate_safe_inter(
        packet_sizes=sizes,
        count=count,
        fifo_size_bytes=fifo_size_bytes,
        fifo_drain_rate_bytes_s=fifo_drain_rate_bytes_s,
        initial_fifo_level_bytes=initial_fifo_level_bytes,
        safety_margin_bytes=safety_margin_bytes,
        resolution_s=resolution_s,
    )


def rate_controlled_send_packets(
    INTERFACE: str,
    payloads: list,
    count: int,
    fifo_size_bytes: int,
    fifo_drain_rate_bytes_s: float,
    initial_fifo_level_bytes: int = 0,
    safety_margin_bytes: int = 0,
    verbose: bool = False,
) -> float:
    """
    Calculates a safe inter value, sends the packets, and returns the used inter.
    """

    sizes = payload_sizes_bytes(payloads)

    inter = calculate_safe_inter(
        packet_sizes=sizes,
        count=count,
        fifo_size_bytes=fifo_size_bytes,
        fifo_drain_rate_bytes_s=fifo_drain_rate_bytes_s,
        initial_fifo_level_bytes=initial_fifo_level_bytes,
        safety_margin_bytes=safety_margin_bytes,
    )

    print("Rate control:")
    print(f"  payload sizes bytes:       {sizes}")
    print(f"  count:                     {count}")
    print(f"  fifo size bytes:           {fifo_size_bytes}")
    print(f"  fifo drain rate bytes/s:   {fifo_drain_rate_bytes_s}")
    print(f"  initial fifo level bytes:  {initial_fifo_level_bytes}")
    print(f"  safety margin bytes:       {safety_margin_bytes}")
    print(f"  calculated inter seconds:  {inter}")
    print(f"  calculated packet rate:    {1.0 / inter if inter > 0 else 'as fast as possible'}")

    ethernetSendPackets(
        INTERFACE=INTERFACE,
        payloads=payloads,
        count=count,
        inter=inter,
        verbose=verbose,
    )

    return inter


if __name__ == "__main__":
    INTERFACE = "Ethernet 6"

    FIFO_SIZE_BYTES = 8192
    FIFO_DRAIN_RATE_BYTES_S = 1_000_000
    SAFETY_MARGIN_BYTES = 1024

    COUNT = 100

    payloads = [
        "packet 1",
        "packet 2",
        "packet 3",
    ]

    used_inter = rate_controlled_send_packets(
        INTERFACE=INTERFACE,
        payloads=payloads,
        count=COUNT,
        fifo_size_bytes=FIFO_SIZE_BYTES,
        fifo_drain_rate_bytes_s=FIFO_DRAIN_RATE_BYTES_S,
        safety_margin_bytes=SAFETY_MARGIN_BYTES,
        verbose=True,
    )

    print(f"Used inter = {used_inter} seconds")
