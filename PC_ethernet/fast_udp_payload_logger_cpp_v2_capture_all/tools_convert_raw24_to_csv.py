import argparse
from pathlib import Path
import numpy as np

def decode_24_lsb(data: bytes, signed: bool) -> np.ndarray:
    n = (len(data) // 3) * 3
    b = np.frombuffer(data[:n], dtype=np.uint8).reshape(-1, 3)
    v = b[:,0].astype(np.uint32) | (b[:,1].astype(np.uint32) << 8) | (b[:,2].astype(np.uint32) << 16)
    if signed:
        v = np.where((v & 0x800000) != 0, v | 0xFF000000, v)
    return v.astype(np.int32)

def main():
    p = argparse.ArgumentParser()
    p.add_argument("input_bin")
    p.add_argument("output_csv")
    p.add_argument("--channels", type=int, default=1)
    p.add_argument("--unsigned", action="store_true")
    p.add_argument("--decimation", type=int, default=1)
    args = p.parse_args()

    data = Path(args.input_bin).read_bytes()
    samples = decode_24_lsb(data, signed=not args.unsigned)
    frame_count = len(samples) // args.channels
    frames = samples[:frame_count * args.channels].reshape(frame_count, args.channels)

    out = Path(args.output_csv)
    out.parent.mkdir(parents=True, exist_ok=True)

    with out.open("w", encoding="utf-8", newline="") as f:
        f.write("frame," + ",".join(f"ch{i}" for i in range(args.channels)) + "\n")
        for idx, row in enumerate(frames):
            if idx % args.decimation != 0:
                continue
            f.write(str(idx) + "," + ",".join(str(int(v)) for v in row) + "\n")

    print("Input bytes:", len(data))
    print("Samples:", len(samples))
    print("Frames:", frame_count)
    print("Wrote:", out)

if __name__ == "__main__":
    main()
