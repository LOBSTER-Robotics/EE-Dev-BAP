from scapy.all import Ether, IP, UDP, Raw, sendp


from ethernetSendHelperFunctions import normalize_payload

def ethernetSendPackets(
    INTERFACE: str = None,
    payloads: list = None,
    count: int = 1,
    inter: float = 0.001,
    verbose: bool = False
) -> None:
    if INTERFACE is None:
        print("No interface selected")
        return None

    if payloads is None:
        print("No payload list given")
        return None

    if not isinstance(payloads, list):
        print("payloads must be a list")
        return None

    packets = []

    for payload in payloads:
        normalized_payload = normalize_payload(payload)

        if normalized_payload is None:
            print(f"Skipping invalid payload: {payload}")
            continue

        packet = (
            Ether(dst="00:11:22:33:44:55", src="12:34:56:78:9A:BC", type=0x0800)
            / IP(src="192.168.1.10", dst="192.168.1.100")
            / UDP(sport=5000, dport=1234)
            / normalized_payload
        )

        packets.append(packet)

    if not packets:
        print("No valid packets to send")
        return None

    sendp(
        packets,
        iface=INTERFACE,
        count=count,
        inter=inter,
        verbose=verbose
    )

if __name__ == "__main__":
    ethernetSendPackets(
        "Ethernet 6",
        ["test 123456789, hello FPGA", "packet 1", "packet 2", "packet 3"],
        count=3,
        inter=0.001,
        verbose=True
    )