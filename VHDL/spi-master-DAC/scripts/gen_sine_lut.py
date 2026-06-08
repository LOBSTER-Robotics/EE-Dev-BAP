"""
gen_sine_lut.py
---------------
Generates a 256-entry 16-bit unsigned sine lookup table and writes it
into vhdl/sine_wave_gen.vhd as a hardcoded VHDL constant.

Encoding:
    value(i) = round(32767.5 * (1 + sin(2π * i / 256)))
    → maps [-1, 1] to [0, 65535], midpoint at 32768 (0x8000)

Key reference points:
    i =   0  →  0x8000  (32768, zero crossing rising)
    i =  64  →  0xFFFF  (65535, positive peak)
    i = 128  →  0x8000  (32768, zero crossing falling)
    i = 192  →  0x0000  (0,     negative peak)

Usage:
    python scripts/gen_sine_lut.py
    (run from the vhdl/ directory, or adjust VHDL_FILE path below)
"""

import math
import re
from pathlib import Path

# ── configuration ─────────────────────────────────────────────────────────────

N_ENTRIES   = 256
VHDL_FILE   = Path(__file__).parent.parent / "sine_wave_gen.vhd"
VALUES_PER_ROW = 8   # how many hex values to print per line in the constant

# ── compute LUT ───────────────────────────────────────────────────────────────

def compute_lut(n: int) -> list[int]:
    lut = []
    for i in range(n):
        angle = 2.0 * math.pi * i / n
        value = round(32767.5 * (1.0 + math.sin(angle)))
        value = max(0, min(65535, value))   # clamp to 16-bit unsigned
        lut.append(value)
    return lut

# ── format as VHDL constant body ──────────────────────────────────────────────

def format_vhdl_constant(lut: list[int], values_per_row: int) -> str:
    lines = []
    for i, v in enumerate(lut):
        hex_val = f'x"{v:04X}"'
        is_last = (i == len(lut) - 1)
        suffix  = "" if is_last else ","
        col     = i % values_per_row

        if col == 0:
            # start of a new row — add index comment
            lines.append(f"        -- i = {i}")
            lines.append(f"        {hex_val}{suffix}")
        else:
            # append to current row (strip newline from last entry, add inline)
            lines[-1] = lines[-1].rstrip() + f" {hex_val}{suffix}"

    return "\n".join(lines)

# ── splice into the VHDL file ─────────────────────────────────────────────────

MARKER_START = "-- <<LUT_START>>"
MARKER_END   = "-- <<LUT_END>>"

def splice_lut_into_vhdl(path: Path, lut_body: str) -> None:
    original = path.read_text(encoding="utf-8")

    pattern = re.compile(
        rf"{re.escape(MARKER_START)}.*?{re.escape(MARKER_END)}",
        re.DOTALL,
    )

    replacement = f"{MARKER_START}\n{lut_body}\n        {MARKER_END}"

    if not pattern.search(original):
        print(f"ERROR: markers {MARKER_START!r} / {MARKER_END!r} not found in {path}")
        print("       Add them around the constant body in sine_wave_gen.vhd first.")
        return

    updated = pattern.sub(replacement, original)
    path.write_text(updated, encoding="utf-8")
    print(f"Updated {path}")

# ── main ──────────────────────────────────────────────────────────────────────

if __name__ == "__main__":
    lut = compute_lut(N_ENTRIES)

    # Sanity-check a few reference points
    assert lut[0]   == 32768, f"i=0   expected 32768, got {lut[0]}"
    assert lut[64]  == 65535, f"i=64  expected 65535, got {lut[64]}"
    assert lut[128] == 32768, f"i=128 expected 32768, got {lut[128]}"
    assert lut[192] == 0,     f"i=192 expected 0,     got {lut[192]}"
    print("Sanity checks passed.")

    lut_body = format_vhdl_constant(lut, VALUES_PER_ROW)

    if VHDL_FILE.exists():
        splice_lut_into_vhdl(VHDL_FILE, lut_body)
    else:
        print(f"VHDL file not found at {VHDL_FILE}")
        print("Printing LUT constant body to stdout instead:\n")
        print(lut_body)
