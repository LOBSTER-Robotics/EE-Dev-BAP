"""
Live plot CSV data written by fast_udp_receiver.exe.
Requires: pip install matplotlib
Usage:
    python scripts\plot_live.py output\samples.csv --channels 0
    python scripts\plot_live.py output\samples.csv --channels 0,1,2,3
    python scripts\plot_live.py output\samples.csv --channels all
"""
import argparse
import csv
from pathlib import Path
import matplotlib.pyplot as plt

def read_csv_tail(path: Path, max_rows: int):
    if not path.exists(): return [], []
    with path.open('r', encoding='utf-8', newline='') as f:
        rows = list(csv.reader(f))
    if len(rows) < 2: return [], []
    header = rows[0]
    data_rows = rows[1:]
    if max_rows > 0: data_rows = data_rows[-max_rows:]
    frames = []
    channels = [[] for _ in header[1:]]
    for row in data_rows:
        if len(row) != len(header): continue
        try:
            frames.append(int(row[0]))
            for i in range(1, len(header)): channels[i - 1].append(int(row[i]))
        except ValueError:
            continue
    return frames, channels

def parse_channels(ch_arg, channel_count):
    if ch_arg.lower() == 'all': return list(range(channel_count))
    return [int(x.strip()) for x in ch_arg.split(',') if x.strip()]

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('csv_file', nargs='?', default='output/samples.csv')
    parser.add_argument('--channels', default='0', help="'all' or comma list, e.g. 0,1,2")
    parser.add_argument('--window', type=int, default=2000, help='Number of recent CSV rows to plot')
    parser.add_argument('--interval', type=float, default=0.2, help='Refresh interval in seconds')
    args = parser.parse_args()
    csv_path = Path(args.csv_file)
    plt.ion()
    fig, ax = plt.subplots()
    try: fig.canvas.manager.set_window_title('24-bit UDP sample plot')
    except Exception: pass
    while True:
        frames, channels = read_csv_tail(csv_path, args.window)
        ax.clear()
        if frames and channels:
            selected = parse_channels(args.channels, len(channels))
            for ch in selected:
                if 0 <= ch < len(channels): ax.plot(frames, channels[ch], label=f'CH{ch}')
            ax.set_title(f'Decoded 24-bit samples from {csv_path}')
            ax.legend(loc='upper right')
        else:
            ax.set_title(f'Waiting for data in {csv_path}')
        ax.set_xlabel('Frame index')
        ax.set_ylabel('Sample value')
        ax.grid(True)
        plt.pause(args.interval)

if __name__ == '__main__': main()
