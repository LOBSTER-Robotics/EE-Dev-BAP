"""
Simple GUI for UDP 24-bit LSB/little-endian receiver and live plotter.

Run as Administrator on Windows.

Install:
    pip install scapy matplotlib numpy

Start:
    python udp_24bit_receiver_gui.py

Incoming sample format:
    Every 3 payload bytes are one 24-bit sample in LSB order:

        value = byte0 + (byte1 << 8) + (byte2 << 16)

    If signed mode is enabled, bit 23 is sign-extended.

Multiple channels are assumed interleaved:

    frame 0: CH0, CH1, CH2, ...
    frame 1: CH0, CH1, CH2, ...
"""

from __future__ import annotations

import collections
import queue
import threading
import time
import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext

import matplotlib
matplotlib.use("TkAgg")

from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure

import numpy as np

from scapy.all import Ether, IP, UDP, Raw, sniff, conf, get_if_addr, get_if_hwaddr


# ============================================================
# Decode helpers
# ============================================================

def decode_24bit_lsb(payload: bytes, signed: bool) -> np.ndarray:
    complete_len = (len(payload) // 3) * 3

    if complete_len == 0:
        return np.empty(0, dtype=np.int32)

    b = np.frombuffer(payload[:complete_len], dtype=np.uint8).reshape(-1, 3)

    values = (
        b[:, 0].astype(np.uint32)
        | (b[:, 1].astype(np.uint32) << 8)
        | (b[:, 2].astype(np.uint32) << 16)
    )

    if signed:
        values = np.where((values & 0x800000) != 0, values | 0xFF000000, values)

    return values.astype(np.int32)


def samples_to_frames(samples: np.ndarray, num_channels: int) -> np.ndarray:
    frame_count = len(samples) // num_channels

    if frame_count <= 0:
        return np.empty((0, num_channels), dtype=np.int32)

    return samples[: frame_count * num_channels].reshape(frame_count, num_channels)


def parse_plot_channels(text: str, num_channels: int) -> list[int]:
    text = text.strip().lower()

    if text == "all":
        return list(range(num_channels))

    out = []
    for item in text.split(","):
        item = item.strip()
        if not item:
            continue

        ch = int(item)

        if ch < 0 or ch >= num_channels:
            raise ValueError(f"Invalid plot channel {ch}; valid range is 0..{num_channels - 1}")

        out.append(ch)

    if not out:
        out = [0]

    return out


# ============================================================
# Interface list helper
# ============================================================

def get_scapy_interfaces() -> list[dict]:
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
            "mac": mac,
        })

    return interfaces


# ============================================================
# Receiver worker
# ============================================================

class ReceiverWorker:
    def __init__(self, gui):
        self.gui = gui
        self.stop_event = threading.Event()
        self.thread = None

    def start(self):
        self.stop_event.clear()
        self.thread = threading.Thread(target=self.run, daemon=True)
        self.thread.start()

    def stop(self):
        self.stop_event.set()

    def make_bpf_filter(self) -> str:
        parts = ["udp"]

        src_ip = self.gui.src_ip_var.get().strip()
        dst_ip = self.gui.dst_ip_var.get().strip()
        sport = int(self.gui.sport_var.get())
        dport = int(self.gui.dport_var.get())

        if src_ip:
            parts.append(f"src host {src_ip}")

        if dst_ip:
            parts.append(f"dst host {dst_ip}")

        if sport != 0:
            parts.append(f"src port {sport}")

        if dport != 0:
            parts.append(f"dst port {dport}")

        return " and ".join(parts)

    def packet_matches_python_filters(self, pkt) -> bool:
        if not pkt.haslayer(Ether) or not pkt.haslayer(IP) or not pkt.haslayer(UDP):
            return False

        eth = pkt[Ether]
        ip = pkt[IP]
        udp = pkt[UDP]

        src_mac = self.gui.src_mac_var.get().strip().lower()
        dst_mac = self.gui.dst_mac_var.get().strip().lower()
        src_ip = self.gui.src_ip_var.get().strip()
        dst_ip = self.gui.dst_ip_var.get().strip()
        sport = int(self.gui.sport_var.get())
        dport = int(self.gui.dport_var.get())

        if src_mac and eth.src.lower() != src_mac:
            return False

        if dst_mac and eth.dst.lower() != dst_mac:
            return False

        if src_ip and ip.src != src_ip:
            return False

        if dst_ip and ip.dst != dst_ip:
            return False

        if sport != 0 and udp.sport != sport:
            return False

        if dport != 0 and udp.dport != dport:
            return False

        return True

    def callback(self, pkt):
        self.gui.stats["raw_packets"] += 1

        if not self.packet_matches_python_filters(pkt):
            return

        payload = bytes(pkt[Raw].load) if pkt.haslayer(Raw) else b""

        self.gui.stats["matched_packets"] += 1
        self.gui.stats["payload_bytes"] += len(payload)

        try:
            self.gui.packet_queue.put_nowait(payload)
        except queue.Full:
            self.gui.stats["software_drops"] += 1

    def run(self):
        try:
            iface = self.gui.get_selected_interface_name()
            bpf = self.make_bpf_filter()

            self.gui.log_threadsafe(f"Starting receiver on: {iface}")
            self.gui.log_threadsafe(f"BPF filter: {bpf}")

            sniff(
                iface=iface,
                filter=bpf,
                prn=self.callback,
                store=False,
                stop_filter=lambda _pkt: self.stop_event.is_set(),
            )

            self.gui.log_threadsafe("Receiver stopped.")

        except Exception as e:
            self.gui.log_threadsafe(f"RX ERROR: {e}")
            self.gui.show_error_threadsafe("Receiver error", str(e))
            self.gui.rx_running = False


# ============================================================
# GUI
# ============================================================

class Udp24BitReceiverGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("UDP 24-bit LSB Receiver Plotter")
        self.root.geometry("1250x760")

        self.interfaces = []

        self.packet_queue: queue.Queue[bytes] = queue.Queue(maxsize=4096)
        self.receiver = None
        self.rx_running = False

        self.stats = {}
        self.reset_stats()

        self.frame_counter = 0
        self.frame_indices = collections.deque(maxlen=2000)
        self.channel_buffers = []
        self.plot_lines = {}

        # Variables
        self.selected_interface = tk.StringVar()

        self.src_mac_var = tk.StringVar(value="")
        self.dst_mac_var = tk.StringVar(value="")
        self.src_ip_var = tk.StringVar(value="192.168.1.100")
        self.dst_ip_var = tk.StringVar(value="192.168.1.10")
        self.sport_var = tk.StringVar(value="1234")
        self.dport_var = tk.StringVar(value="5000")

        self.num_channels_var = tk.StringVar(value="1")
        self.signed_var = tk.BooleanVar(value=True)
        self.plot_channels_var = tk.StringVar(value="0")
        self.plot_window_var = tk.StringVar(value="2000")
        self.plot_decimation_var = tk.StringVar(value="1")

        self._build_gui()
        self.refresh_interfaces()

        self.root.protocol("WM_DELETE_WINDOW", self.on_close)
        self.update_plot_loop()

    def reset_stats(self):
        self.stats = {
            "raw_packets": 0,
            "matched_packets": 0,
            "software_drops": 0,
            "payload_bytes": 0,
            "decoded_samples": 0,
            "decoded_frames": 0,
            "plotted_frames": 0,
            "start_time": time.perf_counter(),
        }

    def _build_gui(self):
        main = ttk.Frame(self.root, padding=8)
        main.pack(fill=tk.BOTH, expand=True)

        left = ttk.Frame(main)
        left.pack(side=tk.LEFT, fill=tk.Y, padx=(0, 8))

        right = ttk.Frame(main)
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True)

        # Interface section
        interface_frame = ttk.LabelFrame(left, text="Interface", padding=8)
        interface_frame.pack(fill=tk.X)

        self.interface_combo = ttk.Combobox(
            interface_frame,
            textvariable=self.selected_interface,
            state="readonly",
            width=68,
        )
        self.interface_combo.grid(row=0, column=0, sticky="ew", padx=3)

        ttk.Button(interface_frame, text="Refresh", command=self.refresh_interfaces).grid(row=0, column=1, padx=3)

        self.interface_details = tk.Text(interface_frame, height=4, width=76, wrap=tk.WORD)
        self.interface_details.grid(row=1, column=0, columnspan=2, pady=5, sticky="ew")
        self.interface_details.configure(state="disabled")

        self.interface_combo.bind("<<ComboboxSelected>>", self.on_interface_selected)

        # Filters
        filt = ttk.LabelFrame(left, text="Packet filters", padding=8)
        filt.pack(fill=tk.X, pady=8)

        self._entry(filt, "Source MAC empty=off", self.src_mac_var, 0)
        self._entry(filt, "Destination MAC empty=off", self.dst_mac_var, 1)
        self._entry(filt, "Source IP empty=off", self.src_ip_var, 2)
        self._entry(filt, "Destination IP empty=off", self.dst_ip_var, 3)
        self._entry(filt, "UDP source port 0=off", self.sport_var, 4)
        self._entry(filt, "UDP dest port 0=off", self.dport_var, 5)

        # Decode / plot settings
        dec = ttk.LabelFrame(left, text="24-bit decode / plot", padding=8)
        dec.pack(fill=tk.X)

        self._entry(dec, "Number of channels", self.num_channels_var, 0)
        ttk.Checkbutton(dec, text="Signed 24-bit", variable=self.signed_var).grid(
            row=1, column=0, columnspan=2, sticky="w", pady=3
        )
        self._entry(dec, "Plot channels", self.plot_channels_var, 2)
        self._entry(dec, "Plot window frames", self.plot_window_var, 3)
        self._entry(dec, "Plot decimation", self.plot_decimation_var, 4)

        ttk.Label(dec, text="Plot channels examples: 0 or 0,1,2,3 or all").grid(
            row=5, column=0, columnspan=2, sticky="w", pady=3
        )

        # Controls
        ctrl = ttk.LabelFrame(left, text="Control", padding=8)
        ctrl.pack(fill=tk.X, pady=8)

        ttk.Button(ctrl, text="Start RX", command=self.start_rx).grid(row=0, column=0, sticky="ew", padx=3)
        ttk.Button(ctrl, text="Stop RX", command=self.stop_rx).grid(row=0, column=1, sticky="ew", padx=3)
        ttk.Button(ctrl, text="Clear plot", command=self.clear_plot).grid(row=1, column=0, sticky="ew", padx=3, pady=3)
        ttk.Button(ctrl, text="Clear log", command=self.clear_log).grid(row=1, column=1, sticky="ew", padx=3, pady=3)

        ctrl.columnconfigure(0, weight=1)
        ctrl.columnconfigure(1, weight=1)

        # Stats
        stats_frame = ttk.LabelFrame(left, text="Stats", padding=8)
        stats_frame.pack(fill=tk.X)

        self.stats_label = ttk.Label(stats_frame, text="", justify=tk.LEFT)
        self.stats_label.pack(anchor="w")

        # Log
        log_frame = ttk.LabelFrame(left, text="Log", padding=8)
        log_frame.pack(fill=tk.BOTH, expand=True, pady=8)

        self.log_text = scrolledtext.ScrolledText(log_frame, height=10, width=76, wrap=tk.WORD)
        self.log_text.pack(fill=tk.BOTH, expand=True)

        # Plot
        plot_frame = ttk.LabelFrame(right, text="Live plot", padding=8)
        plot_frame.pack(fill=tk.BOTH, expand=True)

        self.figure = Figure(figsize=(7.0, 5.0), dpi=100)
        self.ax = self.figure.add_subplot(111)
        self.ax.set_title("Waiting for data")
        self.ax.set_xlabel("Frame index")
        self.ax.set_ylabel("Sample value")
        self.ax.grid(True)

        self.canvas = FigureCanvasTkAgg(self.figure, master=plot_frame)
        self.canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)

    def _entry(self, parent, label, var, row):
        ttk.Label(parent, text=label).grid(row=row, column=0, sticky="w", padx=3, pady=3)
        ttk.Entry(parent, textvariable=var, width=24).grid(row=row, column=1, sticky="ew", padx=3, pady=3)
        parent.columnconfigure(1, weight=1)

    def refresh_interfaces(self):
        try:
            self.interfaces = get_scapy_interfaces()
        except Exception as e:
            messagebox.showerror("Interface error", str(e))
            return

        items = []
        for idx, iface in enumerate(self.interfaces):
            items.append(
                f"{idx}: {iface['description']} | IP: {iface['ip']} | MAC: {iface['mac']} | Name: {iface['name']}"
            )

        self.interface_combo["values"] = items

        if items:
            self.interface_combo.current(0)
            self.on_interface_selected()

        self.log(f"Loaded {len(items)} interface(s).")

    def get_selected_interface_name(self):
        idx = self.interface_combo.current()
        if idx < 0 or idx >= len(self.interfaces):
            raise ValueError("No interface selected")
        return self.interfaces[idx]["name"]

    def on_interface_selected(self, event=None):
        idx = self.interface_combo.current()
        if idx < 0 or idx >= len(self.interfaces):
            return

        iface = self.interfaces[idx]
        text = (
            f"Name:        {iface['name']}\n"
            f"Description: {iface['description']}\n"
            f"IP address:  {iface['ip']}\n"
            f"MAC address: {iface['mac']}\n"
        )

        self.interface_details.configure(state="normal")
        self.interface_details.delete("1.0", tk.END)
        self.interface_details.insert("1.0", text)
        self.interface_details.configure(state="disabled")

    def validate_settings(self):
        num_channels = int(self.num_channels_var.get())
        if num_channels <= 0:
            raise ValueError("Number of channels must be > 0")

        plot_window = int(self.plot_window_var.get())
        if plot_window <= 0:
            raise ValueError("Plot window frames must be > 0")

        plot_decimation = int(self.plot_decimation_var.get())
        if plot_decimation <= 0:
            raise ValueError("Plot decimation must be > 0")

        int(self.sport_var.get())
        int(self.dport_var.get())

        parse_plot_channels(self.plot_channels_var.get(), num_channels)

    def start_rx(self):
        if self.rx_running:
            messagebox.showwarning("Already running", "Receiver is already running.")
            return

        try:
            self.validate_settings()
        except Exception as e:
            messagebox.showerror("Settings error", str(e))
            return

        self.clear_plot()
        self.reset_stats()

        self.rx_running = True
        self.receiver = ReceiverWorker(self)
        self.receiver.start()

    def stop_rx(self):
        if self.receiver is not None:
            self.receiver.stop()
            self.log("Stop requested. One more packet may be needed to exit Scapy sniff.")
        self.rx_running = False

    def clear_plot(self):
        try:
            num_channels = int(self.num_channels_var.get())
            plot_window = int(self.plot_window_var.get())
            plot_channels = parse_plot_channels(self.plot_channels_var.get(), num_channels)
        except Exception:
            num_channels = 1
            plot_window = 2000
            plot_channels = [0]

        self.frame_counter = 0
        self.frame_indices = collections.deque(maxlen=plot_window)
        self.channel_buffers = [
            collections.deque(maxlen=plot_window)
            for _ in range(num_channels)
        ]

        while True:
            try:
                self.packet_queue.get_nowait()
            except queue.Empty:
                break

        self.ax.clear()
        self.ax.set_title("Waiting for data")
        self.ax.set_xlabel("Frame index")
        self.ax.set_ylabel("Sample value")
        self.ax.grid(True)

        self.plot_lines = {}
        for ch in plot_channels:
            (line,) = self.ax.plot([], [], label=f"CH{ch}")
            self.plot_lines[ch] = line

        if self.plot_lines:
            self.ax.legend(loc="upper right")

        self.canvas.draw_idle()

    def process_payload(self, payload: bytes):
        num_channels = int(self.num_channels_var.get())
        signed = self.signed_var.get()
        plot_decimation = int(self.plot_decimation_var.get())

        samples = decode_24bit_lsb(payload, signed=signed)
        frames = samples_to_frames(samples, num_channels)

        if len(frames) == 0:
            return

        self.stats["decoded_samples"] += len(samples)
        self.stats["decoded_frames"] += len(frames)

        for row in frames:
            frame_idx = self.frame_counter
            self.frame_counter += 1

            if frame_idx % plot_decimation != 0:
                continue

            self.frame_indices.append(frame_idx)
            for ch in range(num_channels):
                self.channel_buffers[ch].append(int(row[ch]))

            self.stats["plotted_frames"] += 1

    def update_plot_loop(self):
        # Drain some queued payloads every GUI tick.
        max_packets_per_tick = 200

        for _ in range(max_packets_per_tick):
            try:
                payload = self.packet_queue.get_nowait()
            except queue.Empty:
                break

            try:
                self.process_payload(payload)
            except Exception as e:
                self.log(f"Decode error: {e}")
                break

        # Update plot lines
        if self.plot_lines and len(self.frame_indices) > 0:
            x = np.array(self.frame_indices, dtype=np.int64)

            for ch, line in self.plot_lines.items():
                if ch < len(self.channel_buffers):
                    y = np.array(self.channel_buffers[ch], dtype=np.int32)
                    line.set_data(x, y)

            self.ax.relim()
            self.ax.autoscale_view()

            snap = self.stats_snapshot()
            self.ax.set_title(
                f"24-bit UDP live plot | "
                f"{snap['payload_mbps']:.2f} payload Mb/s | "
                f"{snap['pkt_per_s']:.0f} pkt/s | "
                f"drops {snap['software_drops']}"
            )

            self.canvas.draw_idle()

        self.update_stats_label()
        self.root.after(50, self.update_plot_loop)

    def stats_snapshot(self):
        elapsed = max(time.perf_counter() - self.stats["start_time"], 1e-9)
        return {
            **self.stats,
            "elapsed": elapsed,
            "payload_mbps": self.stats["payload_bytes"] * 8.0 / elapsed / 1e6,
            "pkt_per_s": self.stats["matched_packets"] / elapsed,
            "frames_per_s": self.stats["decoded_frames"] / elapsed,
        }

    def update_stats_label(self):
        s = self.stats_snapshot()
        text = (
            f"Raw packets:        {s['raw_packets']}\n"
            f"Matched packets:    {s['matched_packets']}\n"
            f"Software drops:     {s['software_drops']}\n"
            f"Payload MB/s:       {s['payload_mbps'] / 8.0:.3f}\n"
            f"Payload Mb/s:       {s['payload_mbps']:.3f}\n"
            f"Packets/s:          {s['pkt_per_s']:.1f}\n"
            f"Decoded frames:     {s['decoded_frames']}\n"
            f"Frames/s:           {s['frames_per_s']:.1f}\n"
            f"Plotted frames:     {s['plotted_frames']}\n"
        )
        self.stats_label.configure(text=text)

    def log(self, msg):
        self.log_text.insert(tk.END, msg + "\n")
        self.log_text.see(tk.END)

    def log_threadsafe(self, msg):
        self.root.after(0, lambda: self.log(msg))

    def show_error_threadsafe(self, title, msg):
        self.root.after(0, lambda: messagebox.showerror(title, msg))

    def clear_log(self):
        self.log_text.delete("1.0", tk.END)

    def on_close(self):
        self.stop_rx()
        self.root.destroy()


if __name__ == "__main__":
    root = tk.Tk()
    app = Udp24BitReceiverGUI(root)
    root.mainloop()
