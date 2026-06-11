from scapy.all import conf, get_if_addr, get_if_hwaddr


def get_scapy_interfaces():
    """
    Returns a list of dictionaries containing:
    name, description, ip, and mac for each Scapy interface.
    """
    interfaces = []

    for iface in conf.ifaces.values():
        name = iface.name
        description = iface.description

        try:
            ip = get_if_addr(name)
        except Exception:
            ip = "N/A"

        try:
            mac = get_if_hwaddr(name)
        except Exception:
            mac = "N/A"

        interfaces.append({
            "name": name,
            "description": description,
            "ip": ip,
            "mac": mac
        })

    return interfaces


if __name__ == "__main__":
    print("\nScapy interfaces:\n")

    interfaces = get_scapy_interfaces()

    for iface in interfaces:
        print("--------------------------------------------------")
        print(f"Name:        {iface['name']}")
        print(f"Description: {iface['description']}")
        print(f"IP address:  {iface['ip']}")
        print(f"MAC address: {iface['mac']}")