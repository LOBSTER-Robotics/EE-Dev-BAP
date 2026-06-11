from scapy.all import sniff, Ether, IP, UDP, Raw, conf, get_if_list


# ============================================================
# Packet filter settings
# ============================================================

DST_MAC = "ff:ff:ff:ff:ff:ff"
SRC_MAC = "12:34:56:78:9a:bc"

SRC_IP = "192.168.1.10"
DST_IP = "192.168.1.100"

UDP_DPORT = 5678   # set to 1234 if you want to filter destination port
UDP_SPORT = 1234   # set to 5000 if you want to filter source port

INTERFACE = "Ethernet 6"  # change this to your adapter name


def packet_matches(pkt) -> bool:
    if not pkt.haslayer(Ether):
        return False

    eth = pkt[Ether]

    if eth.dst.lower() != DST_MAC.lower():
        return False

    if eth.src.lower() != SRC_MAC.lower():
        return False

    if eth.type != 0x0800:
        return False

    if not pkt.haslayer(IP):
        return False

    ip = pkt[IP]

    if ip.src != SRC_IP:
        return False

    if ip.dst != DST_IP:
        return False

    if ip.proto != 0x11:
        return False

    if not pkt.haslayer(UDP):
        return False

    udp = pkt[UDP]

    if UDP_DPORT is not None and udp.dport != UDP_DPORT:
        return False

    if UDP_SPORT is not None and udp.sport != UDP_SPORT:
        return False

    return True


def handle_packet(pkt):
    if not packet_matches(pkt):
        return

    print("\nReceived matching FPGA packet")
    print("--------------------------------")
    print(f"Ethernet src MAC: {pkt[Ether].src}")
    print(f"Ethernet dst MAC: {pkt[Ether].dst}")
    print(f"IP src:           {pkt[IP].src}")
    print(f"IP dst:           {pkt[IP].dst}")
    print(f"UDP sport:        {pkt[UDP].sport}")
    print(f"UDP dport:        {pkt[UDP].dport}")
    print(f"UDP length:       {pkt[UDP].len}")

    if pkt.haslayer(Raw):
        payload = bytes(pkt[Raw].load)
        print(f"Payload bytes:    {len(payload)}")
        print(f"Payload hex:      {payload.hex(' ')}")

        try:
            print(f"Payload text:     {payload.decode('utf-8')}")
        except UnicodeDecodeError:
            print("Payload text:     <not valid UTF-8>")
    else:
        print("Payload bytes:    0")


def main():
    print("Available interfaces:")
    for iface in get_if_list():
        print(" -", iface)

    print()
    print(f"Listening on: {INTERFACE}")
    print("Press Ctrl+C to stop.")

    # BPF filter keeps this efficient.
    # It filters IPv4 UDP packets between the two IP addresses.
    # MAC checks are done in Python above.
    bpf_filter = f"udp and src host {SRC_IP} and dst host {DST_IP}"

    sniff(
        iface=INTERFACE,
        filter=bpf_filter,
        prn=handle_packet,
        store=False
    )


if __name__ == "__main__":
    main()