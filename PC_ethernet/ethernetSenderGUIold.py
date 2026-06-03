import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext

from scapy.all import Raw

from ethernetInterfaceChoises import get_scapy_interfaces
from ethernetSendPacket import ethernetSendPacket
from ethernetSendPackets import ethernetSendPackets


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

            # int(x, 0) supports decimal, 0x12, 0b1010, etc.
            values.append(int(item, 0))

        return values

    # Default: plain string payload
    return line


class EthernetSenderGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Scapy Ethernet UDP Sender")
        self.root.geometry("900x650")

        self.interfaces = []

        self.selected_interface = tk.StringVar()
        self.count_var = tk.StringVar(value="1")
        self.inter_var = tk.StringVar(value="0.001")
        self.verbose_var = tk.BooleanVar(value=True)
        self.mode_var = tk.StringVar(value="single")

        self._build_gui()
        self.refresh_interfaces()

    def _build_gui(self):
        main = ttk.Frame(self.root, padding=10)
        main.pack(fill=tk.BOTH, expand=True)

        # Interface section
        interface_frame = ttk.LabelFrame(main, text="Interface", padding=10)
        interface_frame.pack(fill=tk.X)

        ttk.Label(interface_frame, text="Choose interface:").grid(row=0, column=0, sticky="w")

        self.interface_combo = ttk.Combobox(
            interface_frame,
            textvariable=self.selected_interface,
            state="readonly",
            width=95
        )
        self.interface_combo.grid(row=0, column=1, padx=5, sticky="ew")

        refresh_button = ttk.Button(interface_frame, text="Refresh", command=self.refresh_interfaces)
        refresh_button.grid(row=0, column=2, padx=5)

        interface_frame.columnconfigure(1, weight=1)

        self.interface_details = tk.Text(interface_frame, height=5, wrap=tk.WORD)
        self.interface_details.grid(row=1, column=0, columnspan=3, pady=8, sticky="ew")
        self.interface_details.configure(state="disabled")

        self.interface_combo.bind("<<ComboboxSelected>>", self.on_interface_selected)

        # Parameters section
        param_frame = ttk.LabelFrame(main, text="Send parameters", padding=10)
        param_frame.pack(fill=tk.X, pady=10)

        ttk.Label(param_frame, text="Count:").grid(row=0, column=0, sticky="w")
        ttk.Entry(param_frame, textvariable=self.count_var, width=12).grid(row=0, column=1, padx=5, sticky="w")

        ttk.Label(param_frame, text="Inter packet delay [s]:").grid(row=0, column=2, sticky="w")
        ttk.Entry(param_frame, textvariable=self.inter_var, width=12).grid(row=0, column=3, padx=5, sticky="w")

        ttk.Checkbutton(param_frame, text="Verbose", variable=self.verbose_var).grid(row=0, column=4, padx=15, sticky="w")

        ttk.Radiobutton(
            param_frame,
            text="Single packet",
            variable=self.mode_var,
            value="single"
        ).grid(row=1, column=0, pady=8, sticky="w")

        ttk.Radiobutton(
            param_frame,
            text="List of packets",
            variable=self.mode_var,
            value="multiple"
        ).grid(row=1, column=1, pady=8, sticky="w")

        # Payload help section
        help_frame = ttk.LabelFrame(main, text="Payload format", padding=10)
        help_frame.pack(fill=tk.X)

        help_text = (
            "For single packet mode, enter one payload.\n"
            "For list mode, enter one payload per line.\n\n"
            "Supported examples:\n"
            "  Hello FPGA UDP              -> plain string\n"
            "  text:Hello FPGA UDP         -> string\n"
            "  hex:48 65 6C 6C 6F          -> bytes from hex\n"
            "  bytes:48 65 6C 6C 6F        -> bytes from hex\n"
            "  list:12,34,56,78,900000     -> list[int], large ints become multiple bytes\n"
        )

        ttk.Label(help_frame, text=help_text, justify=tk.LEFT).pack(anchor="w")

        # Payload input
        payload_frame = ttk.LabelFrame(main, text="Payload input", padding=10)
        payload_frame.pack(fill=tk.BOTH, expand=True, pady=10)

        self.payload_text = scrolledtext.ScrolledText(payload_frame, height=10, wrap=tk.WORD)
        self.payload_text.pack(fill=tk.BOTH, expand=True)

        self.payload_text.insert(
            "1.0",
            "Hello FPGA UDP 1234\n"
            "list:120,340,560,780,900000\n"
            "hex:48 65 6C 6C 6F\n"
        )

        # Buttons
        button_frame = ttk.Frame(main)
        button_frame.pack(fill=tk.X)

        send_button = ttk.Button(button_frame, text="Send", command=self.send_packets)
        send_button.pack(side=tk.LEFT)

        clear_button = ttk.Button(button_frame, text="Clear log", command=self.clear_log)
        clear_button.pack(side=tk.LEFT, padx=5)

        # Log
        log_frame = ttk.LabelFrame(main, text="Log", padding=10)
        log_frame.pack(fill=tk.BOTH, expand=True, pady=10)

        self.log_text = scrolledtext.ScrolledText(log_frame, height=8, wrap=tk.WORD)
        self.log_text.pack(fill=tk.BOTH, expand=True)

    def refresh_interfaces(self):
        try:
            self.interfaces = get_scapy_interfaces()
        except Exception as e:
            messagebox.showerror("Interface error", f"Could not load Scapy interfaces:\n{e}")
            return

        display_items = []

        for index, iface in enumerate(self.interfaces):
            display_items.append(
                f"{index}: {iface['description']} | IP: {iface['ip']} | MAC: {iface['mac']} | Name: {iface['name']}"
            )

        self.interface_combo["values"] = display_items

        if display_items:
            self.interface_combo.current(0)
            self.on_interface_selected()
        else:
            self.selected_interface.set("")
            self.set_interface_details("No interfaces found.")

        self.log(f"Loaded {len(display_items)} interface(s).")

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

    def get_payload_lines(self):
        raw_text = self.payload_text.get("1.0", tk.END)
        lines = []

        for line in raw_text.splitlines():
            line = line.strip()
            if line:
                lines.append(line)

        return lines

    def send_packets(self):
        iface = self.get_selected_interface_dict()

        if iface is None:
            messagebox.showerror("Missing interface", "Please choose an interface first.")
            return

        interface_name = iface["name"]

        try:
            count = int(self.count_var.get())
            if count < 1:
                raise ValueError("count must be >= 1")
        except Exception as e:
            messagebox.showerror("Invalid count", str(e))
            return

        try:
            inter = float(self.inter_var.get())
            if inter < 0:
                raise ValueError("inter must be >= 0")
        except Exception as e:
            messagebox.showerror("Invalid inter value", str(e))
            return

        verbose = self.verbose_var.get()
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

                self.log(f"Sending single packet on: {interface_name}")
                ethernetSendPacket(
                    INTERFACE=interface_name,
                    payload=payload,
                    count=count,
                    inter=inter,
                    verbose=verbose
                )
                self.log("Single packet send call finished.")

            else:
                payloads = []

                for line in payload_lines:
                    payload = parse_payload_line(line)
                    if payload is not None:
                        payloads.append(payload)

                if not payloads:
                    messagebox.showerror("Invalid payloads", "No valid payloads found.")
                    return

                self.log(f"Sending {len(payloads)} packet payload(s) on: {interface_name}")
                ethernetSendPackets(
                    INTERFACE=interface_name,
                    payloads=payloads,
                    count=count,
                    inter=inter,
                    verbose=verbose
                )
                self.log("Packet list send call finished.")

        except Exception as e:
            messagebox.showerror("Send error", str(e))
            self.log(f"ERROR: {e}")

    def clear_log(self):
        self.log_text.delete("1.0", tk.END)

    def log(self, message):
        self.log_text.insert(tk.END, message + "\n")
        self.log_text.see(tk.END)


if __name__ == "__main__":
    root = tk.Tk()
    app = EthernetSenderGUI(root)
    root.mainloop()
