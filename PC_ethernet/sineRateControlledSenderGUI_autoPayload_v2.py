"""
Sine-wave rate-controlled Ethernet/UDP sender GUI.

This GUI generates repeated 16-channel 16-bit sine-wave UDP payloads and sends
them with a calculated inter-packet delay so the FPGA FIFO does not overflow.

It uses your existing project files:

    ethernetInterfaceChoises.py
    ethernetSendPackets.py
    ethernetSendHelperFunctions.py

Run as Administrator on Windows because Scapy/Npcap usually needs admin rights.

Default packet layout:
    For each time sample:
        CH0 int16
        CH1 int16
        ...
        CH15 int16

    Then next time sample, etc.

So for 16 channels, 45 time samples, 16-bit:
    16 * 45 * 2 = 1440 bytes per UDP payload
"""

import math
import threading
import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext

from ethernetInterfaceChoises import get_scapy_interfaces
from ethernetSendPackets import ethernetSendPackets


# ============================================================
# Sine generation
# ============================================================

def int16_to_bytes(value: int, endianness: str, sample_format: str) -> bytes:
    if endianness not in ("big", "little"):
        raise ValueError("Endianness must be 'big' or 'little'")

    if sample_format == "signed":
        if value < -32768 or value > 32767:
            raise ValueError(f"Signed int16 value out of range: {value}")
        return value.to_bytes(2, byteorder=endianness, signed=True)

    if sample_format == "unsigned":
        if value < 0 or value > 65535:
            raise ValueError(f"Unsigned uint16 value out of range: {value}")
        return value.to_bytes(2, byteorder=endianness, signed=False)

    raise ValueError("Sample format must be 'signed' or 'unsigned'")


def auto_payload_plan(
    sine_freq_hz: float,
    sample_rate_hz: float,
    num_channels: int,
    max_payload_bytes: int,
) -> dict:
    """
    Automatically choose payload packing.

    If one or more complete sine waves fit in a single UDP payload:
        Put as many complete sine waves as possible into one payload.

    If one full sine wave does not fit:
        Split one complete sine wave over multiple UDP payloads.

    For a perfectly repeatable sampled sine wave:
        sample_rate_hz / sine_freq_hz must be an integer.
    """

    if sine_freq_hz <= 0:
        raise ValueError("Sine frequency must be > 0")

    if sample_rate_hz <= 0:
        raise ValueError("Sample rate must be > 0")

    if num_channels <= 0:
        raise ValueError("Number of channels must be > 0")

    if max_payload_bytes <= 0:
        raise ValueError("Max payload bytes must be > 0")

    bytes_per_time_sample = num_channels * 2
    max_samples_per_payload = max_payload_bytes // bytes_per_time_sample

    if max_samples_per_payload <= 0:
        raise ValueError(
            "Max payload is too small for even one time sample.\n"
            f"Max payload bytes:      {max_payload_bytes}\n"
            f"Bytes per time sample:  {bytes_per_time_sample}"
        )

    exact_samples_per_wave = sample_rate_hz / sine_freq_hz
    samples_per_wave = int(round(exact_samples_per_wave))

    if abs(exact_samples_per_wave - samples_per_wave) > 1e-9:
        raise ValueError(
            "sample_rate_hz / sine_freq_hz must be an integer for a perfectly repeatable wave.\n"
            f"Got {sample_rate_hz} / {sine_freq_hz} = {exact_samples_per_wave}"
        )

    waves_per_payload = max_samples_per_payload // samples_per_wave

    if waves_per_payload >= 1:
        samples_per_payload = waves_per_payload * samples_per_wave
        payloads_per_period = 1
        packing_mode = "multiple_full_waves_per_payload"

        return {
            "packing_mode": packing_mode,
            "samples_per_wave": samples_per_wave,
            "max_samples_per_payload": max_samples_per_payload,
            "waves_per_payload": waves_per_payload,
            "samples_per_payload": samples_per_payload,
            "payloads_per_period": payloads_per_period,
            "payload_bytes": samples_per_payload * bytes_per_time_sample,
        }

    payloads_per_period = math.ceil(samples_per_wave / max_samples_per_payload)

    return {
        "packing_mode": "split_one_wave_over_multiple_payloads",
        "samples_per_wave": samples_per_wave,
        "max_samples_per_payload": max_samples_per_payload,
        "waves_per_payload": 0,
        "samples_per_payload": max_samples_per_payload,
        "payloads_per_period": payloads_per_period,
        "payload_bytes": max_samples_per_payload * bytes_per_time_sample,
    }


def generate_sine_payloads(
    sine_freq_hz: float,
    sample_rate_hz: float,
    num_channels: int,
    samples_per_payload: int,
    max_payload_bytes: int,
    endianness: str,
    sample_format: str,
    amplitude_scale: float,
    mode: str,
    auto_samples_per_payload: bool = True,
) -> tuple[list[bytes], dict]:
    """
    Returns payloads as bytes objects.

    auto_samples_per_payload:
        True:
            Automatically chooses samples_per_payload:
              - If full sine waves fit in one payload, pack as many as possible.
              - Otherwise split one wave over multiple payloads.

        False:
            Uses the manually entered samples_per_payload.

    mode:
        "auto_repeatable"
            Recommended. Uses auto payload packing.

        "exact_frequency_multi_payload"
            Keeps requested sine frequency exactly, but may generate multiple
            payloads for one complete period.

        "one_payload_adjust_frequency"
            Generates exactly one payload and adjusts actual sine frequency to:
                sample_rate_hz / samples_per_payload

        "one_payload_strict"
            Requires requested frequency to fit in one payload.
    """

    if sine_freq_hz <= 0:
        raise ValueError("Sine frequency must be > 0")

    if sample_rate_hz <= 0:
        raise ValueError("Sample rate must be > 0")

    if num_channels <= 0:
        raise ValueError("Number of channels must be > 0")

    if max_payload_bytes <= 0:
        raise ValueError("Max payload bytes must be > 0")

    if not 0.0 <= amplitude_scale <= 1.0:
        raise ValueError("Amplitude scale must be between 0.0 and 1.0")

    if mode == "auto_repeatable":
        auto_samples_per_payload = True

    auto_info = None

    if auto_samples_per_payload:
        auto_info = auto_payload_plan(
            sine_freq_hz=sine_freq_hz,
            sample_rate_hz=sample_rate_hz,
            num_channels=num_channels,
            max_payload_bytes=max_payload_bytes,
        )
        samples_per_payload = auto_info["samples_per_payload"]

        # Auto mode always keeps the requested sine frequency exact.
        mode_for_generation = "exact_frequency_multi_payload"
    else:
        if samples_per_payload <= 0:
            raise ValueError("Samples per payload must be > 0")
        mode_for_generation = mode

    bytes_per_payload = num_channels * samples_per_payload * 2

    if bytes_per_payload > max_payload_bytes:
        raise ValueError(
            f"Payload is too large.\n"
            f"{num_channels} channels * {samples_per_payload} samples * 2 bytes = {bytes_per_payload} bytes\n"
            f"Max payload size = {max_payload_bytes} bytes"
        )

    exact_period_samples = sample_rate_hz / sine_freq_hz
    rounded_period_samples = int(round(exact_period_samples))

    if mode_for_generation in ("exact_frequency_multi_payload", "one_payload_strict"):
        if abs(exact_period_samples - rounded_period_samples) > 1e-9:
            raise ValueError(
                "For an exactly repeatable wave, sample_rate_hz / sine_freq_hz must be an integer.\n"
                f"Got {sample_rate_hz} / {sine_freq_hz} = {exact_period_samples}"
            )

        period_samples = rounded_period_samples
        actual_freq_hz = sine_freq_hz

    elif mode_for_generation == "one_payload_adjust_frequency":
        period_samples = samples_per_payload
        actual_freq_hz = sample_rate_hz / period_samples

    else:
        raise ValueError("Invalid sine generation mode")

    if mode_for_generation == "one_payload_strict" and period_samples != samples_per_payload:
        raise ValueError(
            "Requested frequency does not fit exactly in one payload.\n"
            f"Requested period samples: {period_samples}\n"
            f"Samples per payload:      {samples_per_payload}\n"
            f"For one-payload repeat, use sine_freq_hz = sample_rate_hz / samples_per_payload = "
            f"{sample_rate_hz / samples_per_payload:.6f} Hz"
        )

    if auto_samples_per_payload:
        if auto_info["waves_per_payload"] >= 1:
            # Generate one payload containing multiple complete waves.
            total_samples_to_generate = samples_per_payload
        else:
            # Generate one full sine period, split over payloads.
            total_samples_to_generate = period_samples
    elif mode_for_generation == "exact_frequency_multi_payload":
        total_samples_to_generate = period_samples
    else:
        total_samples_to_generate = samples_per_payload

    def sine_value(sample_index: int) -> int:
        angle = 2.0 * math.pi * (sample_index % period_samples) / period_samples
        s = math.sin(angle)

        if sample_format == "signed":
            amplitude = int(32767 * amplitude_scale)
            return int(round(amplitude * s))

        if sample_format == "unsigned":
            amplitude = int(32767 * amplitude_scale)
            return int(round(32768 + amplitude * s))

        raise ValueError("Sample format must be 'signed' or 'unsigned'")

    payloads = []

    for start in range(0, total_samples_to_generate, samples_per_payload):
        count = min(samples_per_payload, total_samples_to_generate - start)
        payload = bytearray()

        for n in range(start, start + count):
            value = sine_value(n)

            for _ch in range(num_channels):
                payload.extend(int16_to_bytes(value, endianness, sample_format))

        payloads.append(bytes(payload))

    if auto_info is None:
        bytes_per_time_sample = num_channels * 2
        auto_info = {
            "packing_mode": "manual_samples_per_payload",
            "samples_per_wave": period_samples,
            "max_samples_per_payload": max_payload_bytes // bytes_per_time_sample,
            "waves_per_payload": 0,
            "samples_per_payload": samples_per_payload,
            "payloads_per_period": len(payloads),
            "payload_bytes": samples_per_payload * bytes_per_time_sample,
        }

    info = {
        "requested_frequency_hz": sine_freq_hz,
        "actual_frequency_hz": actual_freq_hz,
        "sample_rate_hz": sample_rate_hz,
        "period_samples": period_samples,
        "samples_per_payload": samples_per_payload,
        "payload_count_per_wave_or_pattern": len(payloads),
        "payload_sizes_bytes": [len(p) for p in payloads],
        "bytes_per_pattern": sum(len(p) for p in payloads),
        "mode": mode,
        "auto_samples_per_payload": auto_samples_per_payload,
        "packing_mode": auto_info["packing_mode"],
        "samples_per_wave": auto_info["samples_per_wave"],
        "max_samples_per_payload": auto_info["max_samples_per_payload"],
        "waves_per_payload": auto_info["waves_per_payload"],
        "payloads_per_period": auto_info["payloads_per_period"],
    }

    return payloads, info


# ============================================================
# FIFO rate control
# ============================================================

def simulate_fifo_peak(
    packet_sizes: list[int],
    repeat_count: int,
    inter_s: float,
    fifo_drain_rate_bytes_s: float,
    initial_fifo_level_bytes: int = 0,
) -> float:
    level = float(initial_fifo_level_bytes)
    peak = level

    for repeat_index in range(repeat_count):
        for packet_index, packet_size in enumerate(packet_sizes):
            first_packet = repeat_index == 0 and packet_index == 0

            if not first_packet:
                level -= fifo_drain_rate_bytes_s * inter_s
                if level < 0:
                    level = 0.0

            level += packet_size
            peak = max(peak, level)

    return peak


def calculate_safe_inter(
    packet_sizes: list[int],
    repeat_count: int,
    fifo_size_bytes: int,
    fifo_drain_rate_bytes_s: float,
    initial_fifo_level_bytes: int,
    safety_margin_bytes: int,
    resolution_s: float = 1e-6,
) -> float:
    if not packet_sizes:
        raise ValueError("No packets to send")

    if repeat_count < 1:
        raise ValueError("Repeat count must be >= 1")

    if fifo_size_bytes <= 0:
        raise ValueError("FIFO size must be > 0")

    if fifo_drain_rate_bytes_s < 0:
        raise ValueError("FIFO drain rate must be >= 0")

    fifo_limit = fifo_size_bytes - safety_margin_bytes

    if fifo_limit <= 0:
        raise ValueError("Safety margin must be smaller than FIFO size")

    if initial_fifo_level_bytes < 0:
        raise ValueError("Initial FIFO level must be >= 0")

    if initial_fifo_level_bytes >= fifo_limit:
        raise ValueError("Initial FIFO level is already above the safe FIFO limit")

    largest_packet = max(packet_sizes)

    if initial_fifo_level_bytes + largest_packet > fifo_limit:
        raise ValueError(
            "A single packet is too large for the available FIFO space.\n"
            f"Largest packet:      {largest_packet} bytes\n"
            f"Available FIFO room: {fifo_limit - initial_fifo_level_bytes} bytes"
        )

    total_bytes = sum(packet_sizes) * repeat_count

    if fifo_drain_rate_bytes_s == 0:
        if initial_fifo_level_bytes + total_bytes <= fifo_limit:
            return 0.0

        raise ValueError(
            "FIFO drain rate is 0 bytes/s, so the FIFO cannot drain while sending.\n"
            f"Total send bytes: {total_bytes}\n"
            f"Available FIFO:   {fifo_limit - initial_fifo_level_bytes}"
        )

    def is_safe(inter_s: float) -> bool:
        peak = simulate_fifo_peak(
            packet_sizes=packet_sizes,
            repeat_count=repeat_count,
            inter_s=inter_s,
            fifo_drain_rate_bytes_s=fifo_drain_rate_bytes_s,
            initial_fifo_level_bytes=initial_fifo_level_bytes,
        )
        return peak <= fifo_limit

    if is_safe(0.0):
        return 0.0

    low = 0.0
    high = 1.0

    while not is_safe(high):
        high *= 2.0

        if high > 60.0:
            raise ValueError("Could not find a safe interval below 60 seconds")

    while high - low > resolution_s:
        mid = (low + high) / 2.0

        if is_safe(mid):
            high = mid
        else:
            low = mid

    return high


# ============================================================
# GUI
# ============================================================

class SineRateSenderGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Rate-Controlled 16-bit Sine UDP Sender")
        self.root.geometry("1240x760")

        self.interfaces = []
        self.generated_payloads = []

        self.send_thread = None
        self.stop_event = threading.Event()

        # Interface
        self.selected_interface = tk.StringVar()

        # Sine settings
        self.sine_freq_var = tk.StringVar(value="10000")
        self.sample_rate_var = tk.StringVar(value="2000000")
        self.num_channels_var = tk.StringVar(value="16")
        self.samples_per_payload_var = tk.StringVar(value="45")
        self.auto_samples_per_payload_var = tk.BooleanVar(value=True)
        self.max_payload_bytes_var = tk.StringVar(value="1440")
        self.amplitude_var = tk.StringVar(value="0.95")
        self.endianness_var = tk.StringVar(value="big")
        self.sample_format_var = tk.StringVar(value="signed")
        self.wave_mode_var = tk.StringVar(value="auto_repeatable")

        # Rate/FIFO settings
        self.repeat_count_var = tk.StringVar(value="100")
        self.fifo_size_var = tk.StringVar(value="8192")
        self.fifo_drain_rate_var = tk.StringVar(value="1000000")
        self.initial_fifo_level_var = tk.StringVar(value="0")
        self.safety_margin_var = tk.StringVar(value="1024")
        self.manual_inter_var = tk.StringVar(value="")
        self.use_manual_inter_var = tk.BooleanVar(value=False)
        self.verbose_var = tk.BooleanVar(value=False)

        self.calculated_inter_var = tk.StringVar(value="-")
        self.actual_freq_var = tk.StringVar(value="-")
        self.payload_count_var = tk.StringVar(value="-")
        self.payload_sizes_var = tk.StringVar(value="-")
        self.auto_plan_var = tk.StringVar(value="-")
        self.samples_per_wave_var = tk.StringVar(value="-")
        self.waves_per_payload_var = tk.StringVar(value="-")

        self._build_gui()
        self.refresh_interfaces()
        self.update_samples_per_payload_state()

    def _build_gui(self):
        main = ttk.Frame(self.root, padding=10)
        main.pack(fill=tk.BOTH, expand=True)

        left = ttk.Frame(main)
        left.pack(side=tk.LEFT, fill=tk.BOTH, expand=True, padx=(0, 8))

        right = ttk.Frame(main)
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True, padx=(8, 0))

        # Interface
        interface_frame = ttk.LabelFrame(left, text="Interface", padding=8)
        interface_frame.pack(fill=tk.X)

        self.interface_combo = ttk.Combobox(
            interface_frame,
            textvariable=self.selected_interface,
            state="readonly",
            width=80
        )
        self.interface_combo.grid(row=0, column=0, sticky="ew", padx=4)
        ttk.Button(interface_frame, text="Refresh", command=self.refresh_interfaces).grid(row=0, column=1, padx=4)
        interface_frame.columnconfigure(0, weight=1)

        self.interface_details = tk.Text(interface_frame, height=3, wrap=tk.WORD)
        self.interface_details.grid(row=1, column=0, columnspan=2, sticky="ew", pady=6)
        self.interface_details.configure(state="disabled")
        self.interface_combo.bind("<<ComboboxSelected>>", self.on_interface_selected)

        # Sine settings
        sine_frame = ttk.LabelFrame(left, text="Sine / Payload settings", padding=8)
        sine_frame.pack(fill=tk.X, pady=8)

        self._entry(sine_frame, "Sine freq [Hz]", self.sine_freq_var, 0, 0)
        self._entry(sine_frame, "Sample rate [S/s]", self.sample_rate_var, 0, 2)
        self._entry(sine_frame, "Channels", self.num_channels_var, 1, 0)

        ttk.Checkbutton(
            sine_frame,
            text="Auto samples/payload",
            variable=self.auto_samples_per_payload_var,
            command=self.update_samples_per_payload_state
        ).grid(row=1, column=2, sticky="w", padx=3, pady=3)

        ttk.Label(sine_frame, text="Manual samples/payload").grid(row=2, column=0, sticky="w", padx=3, pady=3)
        self.samples_per_payload_entry = ttk.Entry(sine_frame, textvariable=self.samples_per_payload_var, width=16)
        self.samples_per_payload_entry.grid(row=2, column=1, sticky="w", padx=3, pady=3)

        self._entry(sine_frame, "Max payload bytes", self.max_payload_bytes_var, 2, 2)
        self._entry(sine_frame, "Amplitude 0..1", self.amplitude_var, 3, 0)

        ttk.Label(sine_frame, text="Endian").grid(row=3, column=2, sticky="w", pady=3)
        ttk.Combobox(
            sine_frame,
            textvariable=self.endianness_var,
            values=["big", "little"],
            state="readonly",
            width=12
        ).grid(row=3, column=3, sticky="w", pady=3)

        ttk.Label(sine_frame, text="Format").grid(row=4, column=0, sticky="w", pady=3)
        ttk.Combobox(
            sine_frame,
            textvariable=self.sample_format_var,
            values=["signed", "unsigned"],
            state="readonly",
            width=12
        ).grid(row=4, column=1, sticky="w", pady=3)

        ttk.Label(sine_frame, text="Wave mode").grid(row=4, column=2, sticky="w", pady=3)
        mode_combo = ttk.Combobox(
            sine_frame,
            textvariable=self.wave_mode_var,
            values=[
                "auto_repeatable",
                "exact_frequency_multi_payload",
                "one_payload_adjust_frequency",
                "one_payload_strict",
            ],
            state="readonly",
            width=30
        )
        mode_combo.grid(row=4, column=3, sticky="ew", pady=3)

        ttk.Button(sine_frame, text="Generate / Calculate", command=self.generate_and_calculate).grid(
            row=5, column=0, columnspan=2, sticky="ew", pady=8
        )

        # Results
        result_frame = ttk.LabelFrame(left, text="Calculated result", padding=8)
        result_frame.pack(fill=tk.X)

        self._label_result(result_frame, "Actual freq [Hz]", self.actual_freq_var, 0)
        self._label_result(result_frame, "Samples/wave", self.samples_per_wave_var, 1)
        self._label_result(result_frame, "Waves/payload", self.waves_per_payload_var, 2)
        self._label_result(result_frame, "Payloads/pattern", self.payload_count_var, 3)
        self._label_result(result_frame, "Payload sizes", self.payload_sizes_var, 4)
        self._label_result(result_frame, "Auto packing", self.auto_plan_var, 5)
        self._label_result(result_frame, "Calculated inter [s]", self.calculated_inter_var, 6)

        # Rate control
        rate_frame = ttk.LabelFrame(right, text="FIFO rate control", padding=8)
        rate_frame.pack(fill=tk.X)

        self._entry(rate_frame, "Repeat count", self.repeat_count_var, 0, 0)
        self._entry(rate_frame, "FIFO size [bytes]", self.fifo_size_var, 1, 0)
        self._entry(rate_frame, "FIFO drain [bytes/s]", self.fifo_drain_rate_var, 2, 0)
        self._entry(rate_frame, "Initial FIFO level", self.initial_fifo_level_var, 3, 0)
        self._entry(rate_frame, "Safety margin", self.safety_margin_var, 4, 0)

        ttk.Checkbutton(
            rate_frame,
            text="Use manual inter instead of calculated",
            variable=self.use_manual_inter_var
        ).grid(row=5, column=0, columnspan=2, sticky="w", pady=4)

        self._entry(rate_frame, "Manual inter [s]", self.manual_inter_var, 6, 0)

        ttk.Checkbutton(rate_frame, text="Verbose Scapy output", variable=self.verbose_var).grid(
            row=7, column=0, columnspan=2, sticky="w", pady=4
        )

        # Send controls
        send_frame = ttk.LabelFrame(right, text="Send control", padding=8)
        send_frame.pack(fill=tk.X, pady=8)

        ttk.Button(send_frame, text="Start sending", command=self.start_sending).grid(row=0, column=0, sticky="ew", padx=4)
        ttk.Button(send_frame, text="Stop after current send call", command=self.stop_sending).grid(row=0, column=1, sticky="ew", padx=4)
        ttk.Button(send_frame, text="Clear log", command=self.clear_log).grid(row=0, column=2, sticky="ew", padx=4)

        send_frame.columnconfigure(0, weight=1)
        send_frame.columnconfigure(1, weight=1)
        send_frame.columnconfigure(2, weight=1)

        note_frame = ttk.LabelFrame(right, text="Notes", padding=8)
        note_frame.pack(fill=tk.X)

        note = (
            "Auto samples/payload:\n"
            "  If full sine waves fit in one UDP packet, the packet contains as many full waves as possible.\n"
            "  If no full wave fits, one full wave is split over multiple packets.\n\n"
            "Example: 100 kHz at 2 MS/s = 20 samples/wave. With 45 max samples/payload, "
            "2 full waves fit in one payload.\n\n"
            "Scapy timing on Windows is not exact; use a FIFO safety margin."
        )
        ttk.Label(note_frame, text=note, justify=tk.LEFT, wraplength=560).pack(anchor="w")

        # Log
        log_frame = ttk.LabelFrame(right, text="Log", padding=8)
        log_frame.pack(fill=tk.BOTH, expand=True, pady=8)

        self.log_text = scrolledtext.ScrolledText(log_frame, height=18, wrap=tk.WORD)
        self.log_text.pack(fill=tk.BOTH, expand=True)

    def _entry(self, parent, label, variable, row, col):
        ttk.Label(parent, text=label).grid(row=row, column=col, sticky="w", padx=3, pady=3)
        ttk.Entry(parent, textvariable=variable, width=16).grid(row=row, column=col + 1, sticky="w", padx=3, pady=3)

    def _label_result(self, parent, label, variable, row):
        ttk.Label(parent, text=label).grid(row=row, column=0, sticky="w", padx=3, pady=3)
        ttk.Label(parent, textvariable=variable, wraplength=480).grid(row=row, column=1, sticky="w", padx=3, pady=3)

    def update_samples_per_payload_state(self):
        if self.auto_samples_per_payload_var.get():
            self.samples_per_payload_entry.configure(state="disabled")
            self.wave_mode_var.set("auto_repeatable")
        else:
            self.samples_per_payload_entry.configure(state="normal")
            if self.wave_mode_var.get() == "auto_repeatable":
                self.wave_mode_var.set("exact_frequency_multi_payload")

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

    def get_selected_interface(self):
        idx = self.interface_combo.current()
        if idx < 0 or idx >= len(self.interfaces):
            raise ValueError("No interface selected")
        return self.interfaces[idx]["name"]

    def on_interface_selected(self, event=None):
        try:
            idx = self.interface_combo.current()
            iface = self.interfaces[idx]
        except Exception:
            return

        text = (
            f"Name: {iface['name']}\n"
            f"Description: {iface['description']}\n"
            f"IP: {iface['ip']}    MAC: {iface['mac']}"
        )

        self.interface_details.configure(state="normal")
        self.interface_details.delete("1.0", tk.END)
        self.interface_details.insert("1.0", text)
        self.interface_details.configure(state="disabled")

    def parse_settings(self):
        settings = {
            "sine_freq_hz": float(self.sine_freq_var.get()),
            "sample_rate_hz": float(self.sample_rate_var.get()),
            "num_channels": int(self.num_channels_var.get()),
            "samples_per_payload": int(self.samples_per_payload_var.get()),
            "auto_samples_per_payload": self.auto_samples_per_payload_var.get(),
            "max_payload_bytes": int(self.max_payload_bytes_var.get()),
            "endianness": self.endianness_var.get(),
            "sample_format": self.sample_format_var.get(),
            "amplitude_scale": float(self.amplitude_var.get()),
            "mode": self.wave_mode_var.get(),
            "repeat_count": int(self.repeat_count_var.get()),
            "fifo_size_bytes": int(self.fifo_size_var.get()),
            "fifo_drain_rate_bytes_s": float(self.fifo_drain_rate_var.get()),
            "initial_fifo_level_bytes": int(self.initial_fifo_level_var.get()),
            "safety_margin_bytes": int(self.safety_margin_var.get()),
        }

        if settings["repeat_count"] < 1:
            raise ValueError("Repeat count must be >= 1")

        return settings

    def generate_and_calculate(self):
        try:
            s = self.parse_settings()

            payloads, info = generate_sine_payloads(
                sine_freq_hz=s["sine_freq_hz"],
                sample_rate_hz=s["sample_rate_hz"],
                num_channels=s["num_channels"],
                samples_per_payload=s["samples_per_payload"],
                max_payload_bytes=s["max_payload_bytes"],
                endianness=s["endianness"],
                sample_format=s["sample_format"],
                amplitude_scale=s["amplitude_scale"],
                mode=s["mode"],
                auto_samples_per_payload=s["auto_samples_per_payload"],
            )

            packet_sizes = [len(p) for p in payloads]

            safe_inter = calculate_safe_inter(
                packet_sizes=packet_sizes,
                repeat_count=s["repeat_count"],
                fifo_size_bytes=s["fifo_size_bytes"],
                fifo_drain_rate_bytes_s=s["fifo_drain_rate_bytes_s"],
                initial_fifo_level_bytes=s["initial_fifo_level_bytes"],
                safety_margin_bytes=s["safety_margin_bytes"],
            )

            peak = simulate_fifo_peak(
                packet_sizes=packet_sizes,
                repeat_count=s["repeat_count"],
                inter_s=safe_inter,
                fifo_drain_rate_bytes_s=s["fifo_drain_rate_bytes_s"],
                initial_fifo_level_bytes=s["initial_fifo_level_bytes"],
            )

            self.generated_payloads = list(payloads)

            self.actual_freq_var.set(f"{info['actual_frequency_hz']:.6f}")
            self.samples_per_wave_var.set(str(info["samples_per_wave"]))
            self.waves_per_payload_var.set(str(info["waves_per_payload"]))
            self.payload_count_var.set(str(info["payload_count_per_wave_or_pattern"]))
            self.payload_sizes_var.set(str(info["payload_sizes_bytes"]))
            self.auto_plan_var.set(info["packing_mode"])
            self.calculated_inter_var.set(f"{safe_inter:.9f}")
            self.samples_per_payload_var.set(str(info["samples_per_payload"]))

            self.log("Generated sine payloads and calculated safe interval.")
            self.log(f"  Mode: {info['mode']}")
            self.log(f"  Auto samples/payload: {info['auto_samples_per_payload']}")
            self.log(f"  Packing: {info['packing_mode']}")
            self.log(f"  Requested freq: {info['requested_frequency_hz']} Hz")
            self.log(f"  Actual freq: {info['actual_frequency_hz']:.6f} Hz")
            self.log(f"  Samples/wave: {info['samples_per_wave']}")
            self.log(f"  Max samples/payload: {info['max_samples_per_payload']}")
            self.log(f"  Chosen samples/payload: {info['samples_per_payload']}")
            self.log(f"  Waves/payload: {info['waves_per_payload']}")
            self.log(f"  Payloads/pattern: {info['payload_count_per_wave_or_pattern']}")
            self.log(f"  Payload sizes: {info['payload_sizes_bytes']}")
            self.log(f"  Repeat count: {s['repeat_count']}")
            self.log(f"  Safe inter: {safe_inter:.9f} s")
            self.log(f"  Simulated peak FIFO: {peak:.1f} bytes")

            return payloads, safe_inter

        except Exception as e:
            messagebox.showerror("Generate/calculate error", str(e))
            self.log(f"ERROR: {e}")
            return None, None

    def start_sending(self):
        if self.send_thread is not None and self.send_thread.is_alive():
            messagebox.showwarning("Already sending", "A send operation is already running.")
            return

        payloads, calculated_inter = self.generate_and_calculate()

        if not payloads:
            return

        try:
            interface_name = self.get_selected_interface()
            repeat_count = int(self.repeat_count_var.get())
            verbose = self.verbose_var.get()

            if self.use_manual_inter_var.get():
                inter = float(self.manual_inter_var.get())
                if inter < 0:
                    raise ValueError("Manual inter must be >= 0")
            else:
                inter = calculated_inter

        except Exception as e:
            messagebox.showerror("Send settings error", str(e))
            return

        self.stop_event.clear()

        self.send_thread = threading.Thread(
            target=self._send_worker,
            args=(interface_name, payloads, repeat_count, inter, verbose),
            daemon=True,
        )
        self.send_thread.start()

    def _send_worker(self, interface_name, payloads, repeat_count, inter, verbose):
        try:
            self.log_threadsafe(f"Starting send on {interface_name}")
            self.log_threadsafe(f"Payloads per pattern: {len(payloads)}")
            self.log_threadsafe(f"Repeat count: {repeat_count}")
            self.log_threadsafe(f"Inter: {inter:.9f} s")

            ethernetSendPackets(
                INTERFACE=interface_name,
                payloads=payloads,
                count=repeat_count,
                inter=inter,
                verbose=verbose,
            )

            self.log_threadsafe("Send call finished.")

        except Exception as e:
            self.log_threadsafe(f"ERROR during send: {e}")
            self.root.after(0, lambda: messagebox.showerror("Send error", str(e)))

    def stop_sending(self):
        # Scapy sendp cannot be cleanly interrupted from another thread during a
        # single blocking sendp call. This flag is kept for future chunked sending.
        self.stop_event.set()
        self.log("Stop requested. Current Scapy send call may need to finish first.")

    def clear_log(self):
        self.log_text.delete("1.0", tk.END)

    def log(self, msg):
        self.log_text.insert(tk.END, msg + "\n")
        self.log_text.see(tk.END)

    def log_threadsafe(self, msg):
        self.root.after(0, lambda: self.log(msg))


if __name__ == "__main__":
    root = tk.Tk()
    app = SineRateSenderGUI(root)
    root.mainloop()
