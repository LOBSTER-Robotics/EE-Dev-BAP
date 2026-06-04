import threading
import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext, filedialog

from ethernetInterfaceChoises import get_scapy_interfaces
from ethernetSendPacket import ethernetSendPacket
from ethernetSendPackets import ethernetSendPackets
from ethernetReceivePacketThreaded import ReceiveFilter, start_receiver


def parse_optional_int(text: str):
    text = text.strip()
    if text == "" or text.lower() == "none":
        return None
    return int(text, 0)


def parse_payload_line(line: str):
    """
    Convert one GUI payload line into a Python object accepted by normalize_payload().

    Supported formats:
      text:Hello FPGA
      str:Hello FPGA
      bytes:48 65 6C 6C 6F
      hex:48 65 6C 6C 6F
      list:12,34,56,78,900000

    If no prefix is used, the line is treated as a normal string.
    """
    line = line.strip()

    if line == "":
        return None

    lower = line.lower()

    if lower.startswith("text:"):
        return line[5:].strip()

    if lower.startswith("str:"):
        return line[4:].strip()

    if lower.startswith("bytes:"):
        hex_text = line[6:].strip().replace(",", " ").replace("_", " ")
        return bytes.fromhex(hex_text)

    if lower.startswith("hex:"):
        hex_text = line[4:].strip().replace(",", " ").replace("_", " ")
        return bytes.fromhex(hex_text)

    if lower.startswith("list:"):
        list_text = line[5:].strip()
        if list_text == "":
            return []

        values = []
        for item in list_text.replace(";", ",").split(","):
            item = item.strip()
            if item == "":
                continue
            values.append(int(item, 0))
        return values

    return line


class EthernetSendReceiveGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Scapy Ethernet UDP Send + Receive GUI")
        self.root.geometry("1350x760")
        self.root.minsize(1100, 650)

        self.interfaces = []
        self.rx_thread = None
        self.rx_stop_event = None
        self.rx_running = False
        self.rx_packet_count = 0

        # Shared interface
        self.selected_interface = tk.StringVar()

        # TX variables
        self.count_var = tk.StringVar(value="1")
        self.inter_var = tk.StringVar(value="0.001")
        self.verbose_var = tk.BooleanVar(value=True)
        self.mode_var = tk.StringVar(value="single")
        self.file_send_mode_var = tk.StringVar(value="whole_file")

        # RX filter variables, matching your FPGA settings by default
        self.rx_dst_mac_var = tk.StringVar(value="ff:ff:ff:ff:ff:ff")
        self.rx_src_mac_var = tk.StringVar(value="12:34:56:78:9a:bc")
        self.rx_src_ip_var = tk.StringVar(value="192.168.1.10")
        self.rx_dst_ip_var = tk.StringVar(value="192.168.1.100")
        self.rx_sport_var = tk.StringVar(value="1234")
        self.rx_dport_var = tk.StringVar(value="5678")
        self.rx_show_payload_text_var = tk.BooleanVar(value=True)
        self.rx_show_payload_hex_var = tk.BooleanVar(value=True)
        self.rx_max_hex_chars_var = tk.StringVar(value="600")

        self._build_gui()
        self.refresh_interfaces()
        self.root.protocol("WM_DELETE_WINDOW", self.on_close)

    # ============================================================
    # GUI layout
    # ============================================================

    def _build_gui(self):
        outer = ttk.Frame(self.root, padding=8)
        outer.pack(fill=tk.BOTH, expand=True)

        # Top interface selector spans whole window
        interface_frame = ttk.LabelFrame(outer, text="Interface", padding=8)
        interface_frame.pack(fill=tk.X)

        ttk.Label(interface_frame, text="Choose interface:").grid(row=0, column=0, sticky="w")
        self.interface_combo = ttk.Combobox(
            interface_frame,
            textvariable=self.selected_interface,
            state="readonly",
            width=120,
        )
        self.interface_combo.grid(row=0, column=1, padx=5, sticky="ew")
        ttk.Button(interface_frame, text="Refresh", command=self.refresh_interfaces).grid(row=0, column=2, padx=5)
        interface_frame.columnconfigure(1, weight=1)
        self.interface_combo.bind("<<ComboboxSelected>>", self.on_interface_selected)

        self.interface_details = tk.Text(interface_frame, height=3, wrap=tk.WORD)
        self.interface_details.grid(row=1, column=0, columnspan=3, pady=6, sticky="ew")
        self.interface_details.configure(state="disabled")

        # Horizontal main area
        paned = ttk.PanedWindow(outer, orient=tk.HORIZONTAL)
        paned.pack(fill=tk.BOTH, expand=True, pady=8)

        self.tx_panel = ttk.Frame(paned, padding=(0, 0, 5, 0))
        self.rx_panel = ttk.Frame(paned, padding=(5, 0, 0, 0))
        paned.add(self.tx_panel, weight=1)
        paned.add(self.rx_panel, weight=1)

        self._build_tx_panel(self.tx_panel)
        self._build_rx_panel(self.rx_panel)

    def _build_tx_panel(self, parent):
        param_frame = ttk.LabelFrame(parent, text="Send parameters", padding=8)
        param_frame.pack(fill=tk.X)

        ttk.Label(param_frame, text="Count:").grid(row=0, column=0, sticky="w")
        ttk.Entry(param_frame, textvariable=self.count_var, width=10).grid(row=0, column=1, padx=5, sticky="w")

        ttk.Label(param_frame, text="Inter [s]:").grid(row=0, column=2, sticky="w")
        ttk.Entry(param_frame, textvariable=self.inter_var, width=10).grid(row=0, column=3, padx=5, sticky="w")

        ttk.Checkbutton(param_frame, text="Verbose", variable=self.verbose_var).grid(row=0, column=4, padx=8, sticky="w")

        ttk.Radiobutton(param_frame, text="Single", variable=self.mode_var, value="single").grid(row=1, column=0, pady=5, sticky="w")
        ttk.Radiobutton(param_frame, text="List", variable=self.mode_var, value="multiple").grid(row=1, column=1, pady=5, sticky="w")

        file_frame = ttk.LabelFrame(parent, text="TXT file input", padding=8)
        file_frame.pack(fill=tk.X, pady=8)

        ttk.Button(file_frame, text="Load .txt", command=self.load_txt_file_into_payload_box).grid(row=0, column=0, padx=3, pady=2, sticky="w")
        ttk.Button(file_frame, text="Send .txt", command=self.send_txt_file_directly).grid(row=0, column=1, padx=3, pady=2, sticky="w")
        ttk.Radiobutton(file_frame, text="whole file", variable=self.file_send_mode_var, value="whole_file").grid(row=1, column=0, sticky="w")
        ttk.Radiobutton(file_frame, text="line by line", variable=self.file_send_mode_var, value="line_by_line").grid(row=1, column=1, sticky="w")

        help_frame = ttk.LabelFrame(parent, text="Payload format", padding=8)
        help_frame.pack(fill=tk.X)
        ttk.Label(
            help_frame,
            text=(
                "Single: first line only. List: one packet per line.\n"
                "Examples: Hello FPGA | text:Hello | hex:48 65 6C 6C 6F | list:12,34,900000"
            ),
            justify=tk.LEFT,
            wraplength=600,
        ).pack(anchor="w")

        payload_frame = ttk.LabelFrame(parent, text="TX payload input", padding=8)
        payload_frame.pack(fill=tk.BOTH, expand=True, pady=8)
        self.payload_text = scrolledtext.ScrolledText(payload_frame, height=8, wrap=tk.WORD)
        self.payload_text.pack(fill=tk.BOTH, expand=True)
        self.payload_text.insert("1.0", "Hello FPGA UDP 1234\nlist:120,340,560,780,900000\nhex:48 65 6C 6C 6F\n")

        button_frame = ttk.Frame(parent)
        button_frame.pack(fill=tk.X)
        ttk.Button(button_frame, text="Send payload box", command=self.send_packets).pack(side=tk.LEFT)
        ttk.Button(button_frame, text="Clear payload", command=self.clear_payload).pack(side=tk.LEFT, padx=5)
        ttk.Button(button_frame, text="Clear TX log", command=self.clear_tx_log).pack(side=tk.LEFT, padx=5)

        tx_log_frame = ttk.LabelFrame(parent, text="TX log", padding=8)
        tx_log_frame.pack(fill=tk.BOTH, expand=True, pady=8)
        self.tx_log_text = scrolledtext.ScrolledText(tx_log_frame, height=8, wrap=tk.WORD)
        self.tx_log_text.pack(fill=tk.BOTH, expand=True)

    def _build_rx_panel(self, parent):
        filter_frame = ttk.LabelFrame(parent, text="Receive filter", padding=8)
        filter_frame.pack(fill=tk.X)

        ttk.Label(filter_frame, text="Dst MAC:").grid(row=0, column=0, sticky="w")
        ttk.Entry(filter_frame, textvariable=self.rx_dst_mac_var, width=20).grid(row=0, column=1, padx=3, sticky="w")
        ttk.Label(filter_frame, text="Src MAC:").grid(row=0, column=2, sticky="w")
        ttk.Entry(filter_frame, textvariable=self.rx_src_mac_var, width=20).grid(row=0, column=3, padx=3, sticky="w")

        ttk.Label(filter_frame, text="Src IP:").grid(row=1, column=0, sticky="w")
        ttk.Entry(filter_frame, textvariable=self.rx_src_ip_var, width=20).grid(row=1, column=1, padx=3, sticky="w")
        ttk.Label(filter_frame, text="Dst IP:").grid(row=1, column=2, sticky="w")
        ttk.Entry(filter_frame, textvariable=self.rx_dst_ip_var, width=20).grid(row=1, column=3, padx=3, sticky="w")

        ttk.Label(filter_frame, text="UDP sport:").grid(row=2, column=0, sticky="w")
        ttk.Entry(filter_frame, textvariable=self.rx_sport_var, width=20).grid(row=2, column=1, padx=3, sticky="w")
        ttk.Label(filter_frame, text="UDP dport:").grid(row=2, column=2, sticky="w")
        ttk.Entry(filter_frame, textvariable=self.rx_dport_var, width=20).grid(row=2, column=3, padx=3, sticky="w")

        ttk.Label(filter_frame, text="Use blank or None to ignore a port.").grid(row=3, column=0, columnspan=4, sticky="w", pady=(4, 0))

        options_frame = ttk.LabelFrame(parent, text="Receive options", padding=8)
        options_frame.pack(fill=tk.X, pady=8)
        ttk.Checkbutton(options_frame, text="Show payload text", variable=self.rx_show_payload_text_var).grid(row=0, column=0, sticky="w")
        ttk.Checkbutton(options_frame, text="Show payload hex", variable=self.rx_show_payload_hex_var).grid(row=0, column=1, sticky="w")
        ttk.Label(options_frame, text="Max hex chars:").grid(row=0, column=2, sticky="w", padx=(10, 0))
        ttk.Entry(options_frame, textvariable=self.rx_max_hex_chars_var, width=8).grid(row=0, column=3, padx=3, sticky="w")

        button_frame = ttk.Frame(parent)
        button_frame.pack(fill=tk.X)
        self.rx_start_button = ttk.Button(button_frame, text="Start RX", command=self.start_rx)
        self.rx_start_button.pack(side=tk.LEFT)
        self.rx_stop_button = ttk.Button(button_frame, text="Stop RX", command=self.stop_rx, state=tk.DISABLED)
        self.rx_stop_button.pack(side=tk.LEFT, padx=5)
        ttk.Button(button_frame, text="Clear RX log", command=self.clear_rx_log).pack(side=tk.LEFT, padx=5)

        self.rx_status_var = tk.StringVar(value="RX stopped")
        ttk.Label(parent, textvariable=self.rx_status_var).pack(anchor="w", pady=5)

        rx_log_frame = ttk.LabelFrame(parent, text="RX log", padding=8)
        rx_log_frame.pack(fill=tk.BOTH, expand=True)
        self.rx_log_text = scrolledtext.ScrolledText(rx_log_frame, height=22, wrap=tk.WORD)
        self.rx_log_text.pack(fill=tk.BOTH, expand=True)

    # ============================================================
    # Interface handling
    # ============================================================

    def refresh_interfaces(self):
        try:
            self.interfaces = get_scapy_interfaces()
        except Exception as e:
            messagebox.showerror("Interface error", f"Could not load Scapy interfaces:\n{e}")
            return

        display_items = []
        for index, iface in enumerate(self.interfaces):
            display_items.append(f"{index}: {iface['description']} | IP: {iface['ip']} | MAC: {iface['mac']} | Name: {iface['name']}")

        self.interface_combo["values"] = display_items
        if display_items:
            self.interface_combo.current(0)
            self.on_interface_selected()
        else:
            self.selected_interface.set("")
            self.set_interface_details("No interfaces found.")

        self.tx_log(f"Loaded {len(display_items)} interface(s).")

    def get_selected_interface_dict(self):
        index = self.interface_combo.current()
        if index < 0 or index >= len(self.interfaces):
            return None
        return self.interfaces[index]

    def on_interface_selected(self, event=None):
        iface = self.get_selected_interface_dict()
        if iface is None:
            self.set_interface_details("No interface selected.")
            return

        details = (
            f"Name:        {iface['name']}\n"
            f"Description: {iface['description']}\n"
            f"IP address:  {iface['ip']}\n"
            f"MAC address: {iface['mac']}\n"
        )
        self.set_interface_details(details)

    def set_interface_details(self, text):
        self.interface_details.configure(state="normal")
        self.interface_details.delete("1.0", tk.END)
        self.interface_details.insert("1.0", text)
        self.interface_details.configure(state="disabled")

    # ============================================================
    # TX methods
    # ============================================================

    def get_payload_lines(self):
        raw_text = self.payload_text.get("1.0", tk.END)
        return [line.strip() for line in raw_text.splitlines() if line.strip()]

    def get_send_parameters(self):
        iface = self.get_selected_interface_dict()
        if iface is None:
            raise ValueError("Please choose an interface first.")

        count = int(self.count_var.get())
        if count < 1:
            raise ValueError("count must be >= 1")

        inter = float(self.inter_var.get())
        if inter < 0:
            raise ValueError("inter must be >= 0")

        return iface["name"], count, inter, self.verbose_var.get()

    def ask_txt_file_path(self):
        return filedialog.askopenfilename(title="Choose TXT file", filetypes=[("Text files", "*.txt"), ("All files", "*.*")])

    def read_txt_file(self, file_path):
        with open(file_path, "r", encoding="utf-8-sig") as file:
            return file.read()

    def load_txt_file_into_payload_box(self):
        file_path = self.ask_txt_file_path()
        if not file_path:
            return
        try:
            text = self.read_txt_file(file_path)
        except Exception as e:
            messagebox.showerror("File read error", str(e))
            self.tx_log(f"ERROR reading file: {e}")
            return

        self.payload_text.delete("1.0", tk.END)
        self.payload_text.insert("1.0", text)
        self.tx_log(f"Loaded TXT file into payload box: {file_path}")

    def send_txt_file_directly(self):
        file_path = self.ask_txt_file_path()
        if not file_path:
            return

        try:
            interface_name, count, inter, verbose = self.get_send_parameters()
            text = self.read_txt_file(file_path)
        except Exception as e:
            messagebox.showerror("Error", str(e))
            self.tx_log(f"ERROR: {e}")
            return

        try:
            if self.file_send_mode_var.get() == "line_by_line":
                payloads = [line for line in text.splitlines() if line.strip()]
                if not payloads:
                    messagebox.showerror("Empty file", "The TXT file has no non-empty lines to send.")
                    return

                self.tx_log(f"Sending TXT file line-by-line as {len(payloads)} packet(s): {file_path}")
                ethernetSendPackets(INTERFACE=interface_name, payloads=payloads, count=count, inter=inter, verbose=verbose)
                self.tx_log("TXT line-by-line send call finished.")
            else:
                if text == "":
                    messagebox.showerror("Empty file", "The TXT file is empty.")
                    return

                self.tx_log(f"Sending whole TXT file as one packet: {file_path}")
                ethernetSendPacket(INTERFACE=interface_name, payload=text, count=count, inter=inter, verbose=verbose)
                self.tx_log("TXT whole-file send call finished.")
        except Exception as e:
            messagebox.showerror("Send error", str(e))
            self.tx_log(f"ERROR: {e}")

    def send_packets(self):
        try:
            interface_name, count, inter, verbose = self.get_send_parameters()
        except Exception as e:
            messagebox.showerror("Parameter error", str(e))
            return

        payload_lines = self.get_payload_lines()
        if not payload_lines:
            messagebox.showerror("Missing payload", "Please enter at least one payload.")
            return

        try:
            if self.mode_var.get() == "single":
                payload = parse_payload_line(payload_lines[0])
                if payload is None:
                    messagebox.showerror("Invalid payload", "The first payload line is empty.")
                    return

                self.tx_log(f"Sending single packet on: {interface_name}")
                ethernetSendPacket(INTERFACE=interface_name, payload=payload, count=count, inter=inter, verbose=verbose)
                self.tx_log("Single packet send call finished.")
            else:
                payloads = []
                for line in payload_lines:
                    payload = parse_payload_line(line)
                    if payload is not None:
                        payloads.append(payload)

                if not payloads:
                    messagebox.showerror("Invalid payloads", "No valid payloads found.")
                    return

                self.tx_log(f"Sending {len(payloads)} packet payload(s) on: {interface_name}")
                ethernetSendPackets(INTERFACE=interface_name, payloads=payloads, count=count, inter=inter, verbose=verbose)
                self.tx_log("Packet list send call finished.")
        except Exception as e:
            messagebox.showerror("Send error", str(e))
            self.tx_log(f"ERROR: {e}")

    # ============================================================
    # RX methods
    # ============================================================

    def get_receive_filter(self):
        return ReceiveFilter(
            dst_mac=self.rx_dst_mac_var.get().strip(),
            src_mac=self.rx_src_mac_var.get().strip(),
            src_ip=self.rx_src_ip_var.get().strip(),
            dst_ip=self.rx_dst_ip_var.get().strip(),
            udp_sport=parse_optional_int(self.rx_sport_var.get()),
            udp_dport=parse_optional_int(self.rx_dport_var.get()),
        )

    def start_rx(self):
        if self.rx_running:
            return

        iface = self.get_selected_interface_dict()
        if iface is None:
            messagebox.showerror("Missing interface", "Please choose an interface first.")
            return

        try:
            rx_filter = self.get_receive_filter()
            int(self.rx_max_hex_chars_var.get())
        except Exception as e:
            messagebox.showerror("RX parameter error", str(e))
            return

        self.rx_packet_count = 0
        self.rx_stop_event = threading.Event()
        interface_name = iface["name"]

        self.rx_running = True
        self.rx_start_button.configure(state=tk.DISABLED)
        self.rx_stop_button.configure(state=tk.NORMAL)
        self.rx_status_var.set("RX starting...")

        self.rx_thread = start_receiver(
            interface=interface_name,
            rx_filter=rx_filter,
            packet_callback=self.rx_packet_callback_threadsafe,
            status_callback=self.rx_status_callback_threadsafe,
            stop_event=self.rx_stop_event,
        )

    def stop_rx(self):
        if self.rx_stop_event is not None:
            self.rx_stop_event.set()
        self.rx_running = False
        self.rx_start_button.configure(state=tk.NORMAL)
        self.rx_stop_button.configure(state=tk.DISABLED)
        self.rx_status_var.set("RX stopping...")

    def rx_status_callback_threadsafe(self, message: str):
        self.root.after(0, lambda: self.rx_status_callback(message))

    def rx_status_callback(self, message: str):
        self.rx_status_var.set(message)
        self.rx_log(message)
        if message == "RX stopped":
            self.rx_running = False
            self.rx_start_button.configure(state=tk.NORMAL)
            self.rx_stop_button.configure(state=tk.DISABLED)

    def rx_packet_callback_threadsafe(self, packet_info: dict):
        self.root.after(0, lambda: self.display_rx_packet(packet_info))

    def display_rx_packet(self, p: dict):
        self.rx_packet_count += 1
        self.rx_status_var.set(f"RX running - matched packets: {self.rx_packet_count}")

        lines = [
            f"\nPacket #{self.rx_packet_count}",
            "----------------------------------------",
            f"Ethernet: {p['eth_src']} -> {p['eth_dst']}",
            f"IP:       {p['ip_src']} -> {p['ip_dst']}",
            f"UDP:      {p['udp_sport']} -> {p['udp_dport']}   UDP len: {p['udp_len']}",
            f"Payload:  {p['payload_len']} bytes",
        ]

        if self.rx_show_payload_text_var.get():
            lines.append(f"Text:     {p['payload_text']}")

        if self.rx_show_payload_hex_var.get():
            max_chars = int(self.rx_max_hex_chars_var.get())
            payload_hex = p["payload_hex"]
            if len(payload_hex) > max_chars:
                payload_hex = payload_hex[:max_chars] + " ... <truncated>"
            lines.append(f"Hex:      {payload_hex}")

        self.rx_log("\n".join(lines))

    # ============================================================
    # Utility methods
    # ============================================================

    def clear_payload(self):
        self.payload_text.delete("1.0", tk.END)

    def clear_tx_log(self):
        self.tx_log_text.delete("1.0", tk.END)

    def clear_rx_log(self):
        self.rx_log_text.delete("1.0", tk.END)
        self.rx_packet_count = 0

    def tx_log(self, message):
        self.tx_log_text.insert(tk.END, message + "\n")
        self.tx_log_text.see(tk.END)

    def rx_log(self, message):
        self.rx_log_text.insert(tk.END, message + "\n")
        self.rx_log_text.see(tk.END)

    def on_close(self):
        self.stop_rx()
        self.root.after(100, self.root.destroy)


if __name__ == "__main__":
    root = tk.Tk()
    app = EthernetSendReceiveGUI(root)
    root.mainloop()
