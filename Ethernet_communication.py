import tkinter as tk
import threading
from scapy.all import sendp, sniff, get_if_list

interface = "Ethernet"

my_ip = [10, 0, 0, 10]
fpga_ip = [10, 0, 0, 240]

my_mac = b"\xe8\x6a\x64\xe7\xe8\x29"
fpga_mac = b"\xe8\x6a\x64\xe7\xe8\x30"

send_string = "LEDs CHANGED!     "
def mac_to_str(mac):
    return ":".join(f"{b:02x}" for b in mac)


def ip_to_str(ip):
    return ".".join(str(b) for b in ip)

def decode_udp_packet(packet):
    print("\n--- Decoded packet ---")

    dst_mac = packet[0:6]
    src_mac = packet[6:12]
    eth_type = int.from_bytes(packet[12:14], "big")

    print("Ethernet:")
    print(f"  Destination MAC : {mac_to_str(dst_mac)}")
    print(f"  Source MAC      : {mac_to_str(src_mac)}")
    print(f"  EtherType       : 0x{eth_type:04x}")

    ip_start = 14
    version_ihl = packet[ip_start]
    ihl = version_ihl & 0x0f
    ip_header_len = ihl * 4

    total_length = int.from_bytes(packet[ip_start + 2:ip_start + 4], "big")
    ttl = packet[ip_start + 8]
    protocol = packet[ip_start + 9]
    checksum = int.from_bytes(packet[ip_start + 10:ip_start + 12], "big")
    src_ip = packet[ip_start + 12:ip_start + 16]
    dst_ip = packet[ip_start + 16:ip_start + 20]

    print("IPv4:")
    print(f"  Source IP       : {ip_to_str(src_ip)}")
    print(f"  Destination IP  : {ip_to_str(dst_ip)}")
    print(f"  Total length    : {total_length}")
    print(f"  TTL             : {ttl}")
    print(f"  Protocol        : {protocol}")
    print(f"  Header checksum : 0x{checksum:04x}")

    udp_start = ip_start + ip_header_len

    src_port = int.from_bytes(packet[udp_start:udp_start + 2], "big")
    dst_port = int.from_bytes(packet[udp_start + 2:udp_start + 4], "big")
    udp_length = int.from_bytes(packet[udp_start + 4:udp_start + 6], "big")
    udp_checksum = int.from_bytes(packet[udp_start + 6:udp_start + 8], "big")
    payload = packet[udp_start + 8:udp_start + udp_length]

    print("UDP:")
    print(f"  Source port      : {src_port}")
    print(f"  Destination port : {dst_port}")
    print(f"  Length           : {udp_length}")
    print(f"  Checksum         : 0x{udp_checksum:04x}")

    print("Payload:")
    print(f"  Hex   : {payload.hex(' ')}")
    print(f"  ASCII : {payload.decode('utf-8', errors='replace')}")

    print("--- End decoded packet ---\n")

class EthExampleApp:
    def __init__(self, root, interface, my_ip, fpga_ip, my_mac, fpga_mac, send_string):

        self.root = root

        self.running = True  # Control flag for the thread

        # Network details
        self.interface = interface
        self.my_ip = my_ip
        self.fpga_ip = fpga_ip
        self.my_mac = my_mac
        self.fpga_mac = fpga_mac
        self.send_string = send_string

        self.createSocket()
        self.createWindow()

        # Start the counter thread
        self.sw_thread = threading.Thread(target=self.updateSwitches)
        self.sw_thread.start()

        # Ensure proper shutdown
        root.protocol("WM_DELETE_WINDOW", self.on_closing)

    def createSocket(self):
        """
        Creates the socket connection
        """
        # Bind to ethernet socket (Requires user rights or sudo)
        pass

    def createWindow(self):
        """
        Creates the tkinter window
        """

        root = self.root

        #Create TKinter window
        # Create the main application window
        # Create a Label widget to provide LED values
        self.instruction_label = tk.Label(root, text="LED value")
        self.instruction_label.pack(pady=5)  # Add some padding around the widget

        # Create an Entry widget to enter LED value desired
        self.entry_text = tk.StringVar()
        self.entry = tk.Entry(root, textvariable=self.entry_text)
        self.entry.pack(pady=10)  # Add some padding around the widget

        # Create a Button widget to trigger LED packet creation
        self.button = tk.Button(root, text="Set LED value", command=self.setLEDValue)
        self.button.pack(pady=10)

        # Create a Button widget to trigger LED packet creation
        self.button = tk.Button(root, text="Switches to LEDs", command=self.switchesToLeds)
        self.button.pack(pady=10)

        # Create a Label widget to display the LED value
        self.led_label = tk.Label(root, text="")
        self.led_label.pack(pady=10)

        # Create a Label widget to display the Switches label
        self.switches_label = tk.Label(root, text="")
        self.switches_label.pack(pady=10)

    def sendLEDpacket(self, value):
        # String to send over network

        # base packet
        packet = bytearray(
            b"\xe8\x6a\x64\xe7\xe8\x30\xec\x08\x6b\x0d\xfc\x31\x08\x00\x45\x00\x00\x41\x00\x00\x00\x00\x40\x11\x65\xb3\x0a\x00\x00\x0a\x0a\x00\x00\xf0\xff\xff\xff\xff\x00\x2d\x00\x00\x53\x57\x49\x54\x43\x48\x45\x53\x20\x43\x48\x41\x4e\x47\x45\x44\x21\x20\x4e\x45\x57\x20\x56\x41\x4c\x55\x45\x3a\x20\x30\x78\x00\x01\x38\x30\x0a\x0d")

        packet[0:6] = self.fpga_mac  # destination MAC
        packet[6:12] = self.my_mac
        # Put IP values into packet
        packet[26:29] = self.my_ip
        packet[30:33] = self.fpga_ip

        # Put string into packet
        for index, letter in enumerate(self.send_string):
            packet[42 + index] = ord(letter)

        # update packet
        packet[73] = int(value)//256
        packet[74] = int(value)%256

        udp_payload_length = len(packet) - 42
        udp_length = 8 + udp_payload_length
        ip_total_length = 20 + udp_length

        packet[16:18] = ip_total_length.to_bytes(2, "big")
        packet[38:40] = udp_length.to_bytes(2, "big")

        packet[24:26] = b"\x00\x00"
        checksum = self.ip_checksum(packet[14:34])
        packet[24:26] = checksum.to_bytes(2, "big")

        decode_udp_packet(packet)

        sendp(bytes(packet), iface=self.interface, verbose=False)

    def ip_checksum(self, header):
        total = 0

        if len(header) % 2:
            header += b"\x00"

        for i in range(0, len(header), 2):
            word = (header[i] << 8) + header[i + 1]
            total += word

            while total >> 16:
                total = (total & 0xffff) + (total >> 16)

        return (~total) & 0xffff

    def getSWValue(self):
        packets = sniff(iface=self.interface, count=1, timeout=0.5)

        if not packets:
            return None

        r = bytes(packets[0])

        if r[0:6] == self.my_mac and r[6:12] == self.fpga_mac:
            return r

        return None

    def updateSwitches(self):
        while self.running:
            sw_value = self.getSWValue()
            if sw_value is not None:
                self.sw_value = sw_value
                self.switches_label.config(text=f'Switches: {int.from_bytes(self.sw_value[-6:-2])}')

    # Function to get the content of the Entry widget and update the led_label
    def setLEDValue(self):
        led_value = int(self.entry.get())  # Retrieve the text from the Entry widget
        self.led_label.config(text=f'Leds: 0x{led_value:04x}')  # Update the led_label
        self.sendLEDpacket(led_value)

    # Function to get the content of the Entry widget and update the led_label
    def switchesToLeds(self):
        self.led_label.config(text=f'Leds: 0x{self.sw_value[-6:-2].hex()}')  # Update the led_label
        self.sendLEDpacket(int.from_bytes(self.sw_value[-6:-2], "big"))
        self.entry_text.set(f'{int.from_bytes(self.sw_value[-6:-2], "big")}')

    def on_closing(self):
        # Stop the counter thread and close the window
        self.running = False
        self.sw_thread.join()  # Wait for the thread to finish
        self.root.destroy()


# Create the main application window
root = tk.Tk()
root.title("Integrated Example App")
# Create an instance of the CounterApp class
app = EthExampleApp(root, interface, my_ip, fpga_ip, my_mac, fpga_mac, send_string)

# Run the Tkinter event loop
root.mainloop()
