"""
Thread-friendly Scapy UDP/Ethernet receiver for the Tkinter GUI.

This module does not print by itself. Instead, call start_receiver(...)
with a callback. The callback receives a dictionary for every matching packet.

On Windows, run the GUI as Administrator and make sure Npcap is installed.
"""

from __future__ import annotations

import threading
from dataclasses import dataclass
from typing import Callable, Optional

from scapy.all import sniff, Ether, IP, UDP, Raw


@dataclass
class ReceiveFilter:
    dst_mac: str = "ff:ff:ff:ff:ff:ff"
    src_mac: str = "12:34:56:78:9a:bc"
    src_ip: str = "192.168.1.10"
    dst_ip: str = "192.168.1.100"
    udp_sport: Optional[int] = 1234
    udp_dport: Optional[int] = 5678


def _mac_equal(a: str, b: str) -> bool:
    return a.lower() == b.lower()


def packet_matches(pkt, rx_filter: ReceiveFilter) -> bool:
    if not pkt.haslayer(Ether):
        return False

    eth = pkt[Ether]

    if rx_filter.dst_mac and not _mac_equal(eth.dst, rx_filter.dst_mac):
        return False

    if rx_filter.src_mac and not _mac_equal(eth.src, rx_filter.src_mac):
        return False

    if eth.type != 0x0800:
        return False

    if not pkt.haslayer(IP):
        return False

    ip = pkt[IP]

    if rx_filter.src_ip and ip.src != rx_filter.src_ip:
        return False

    if rx_filter.dst_ip and ip.dst != rx_filter.dst_ip:
        return False

    if ip.proto != 0x11:
        return False

    if not pkt.haslayer(UDP):
        return False

    udp = pkt[UDP]

    if rx_filter.udp_sport is not None and udp.sport != rx_filter.udp_sport:
        return False

    if rx_filter.udp_dport is not None and udp.dport != rx_filter.udp_dport:
        return False

    return True


def packet_to_dict(pkt) -> dict:
    payload = b""
    if pkt.haslayer(Raw):
        payload = bytes(pkt[Raw].load)

    try:
        payload_text = payload.decode("utf-8")
    except UnicodeDecodeError:
        payload_text = "<not valid UTF-8>"

    return {
        "eth_src": pkt[Ether].src,
        "eth_dst": pkt[Ether].dst,
        "ip_src": pkt[IP].src,
        "ip_dst": pkt[IP].dst,
        "udp_sport": pkt[UDP].sport,
        "udp_dport": pkt[UDP].dport,
        "udp_len": pkt[UDP].len,
        "payload_len": len(payload),
        "payload_hex": payload.hex(" "),
        "payload_text": payload_text,
    }


def make_bpf_filter(rx_filter: ReceiveFilter) -> str:
    """
    Build a BPF filter. MAC filtering is intentionally done in Python,
    because Windows/Npcap can be picky with complex BPF expressions.
    """
    parts = ["udp"]

    if rx_filter.src_ip:
        parts.append(f"src host {rx_filter.src_ip}")

    if rx_filter.dst_ip:
        parts.append(f"dst host {rx_filter.dst_ip}")

    if rx_filter.udp_sport is not None:
        parts.append(f"src port {rx_filter.udp_sport}")

    if rx_filter.udp_dport is not None:
        parts.append(f"dst port {rx_filter.udp_dport}")

    return " and ".join(parts)


def start_receiver(
    interface: str,
    rx_filter: ReceiveFilter,
    packet_callback: Callable[[dict], None],
    status_callback: Optional[Callable[[str], None]] = None,
    stop_event: Optional[threading.Event] = None,
) -> threading.Thread:
    """
    Start sniffing in a daemon thread.

    packet_callback(packet_dict) is called for every matching packet.
    status_callback(message) is called for status/error messages.
    stop_event can be set to stop the sniff loop.
    """
    if stop_event is None:
        stop_event = threading.Event()

    def status(message: str):
        if status_callback is not None:
            status_callback(message)

    def handle(pkt):
        if packet_matches(pkt, rx_filter):
            packet_callback(packet_to_dict(pkt))

    def should_stop(_pkt) -> bool:
        return stop_event.is_set()

    def run():
        bpf_filter = make_bpf_filter(rx_filter)
        status(f"RX started on {interface}")
        status(f"BPF filter: {bpf_filter}")

        try:
            # timeout makes Scapy periodically return control so stop_event is checked
            # even when no packets are arriving.
            while not stop_event.is_set():
                sniff(
                    iface=interface,
                    filter=bpf_filter,
                    prn=handle,
                    store=False,
                    timeout=1,
                    stop_filter=should_stop,
                )
        except Exception as e:
            status(f"RX ERROR: {e}")
        finally:
            status("RX stopped")

    thread = threading.Thread(target=run, daemon=True)
    thread.start()
    return thread
