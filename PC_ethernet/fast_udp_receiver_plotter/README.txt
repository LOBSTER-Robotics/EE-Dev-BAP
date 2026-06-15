Fast UDP Receiver + 24-bit LSB Plotter
=====================================

This project captures UDP packets using C++/Npcap, decodes the UDP payload as
24-bit samples in LSB byte order, writes decoded samples to CSV, and plots the
CSV using a small Python/matplotlib live plotter.

Incoming 24-bit LSB format
--------------------------
The incoming payload is decoded in groups of 3 bytes:

  byte0 byte1 byte2

LSB order means:

  unsigned_value = byte0 + (byte1 << 8) + (byte2 << 16)

If signed mode is enabled, bit 23 is sign-extended:

  0x7FFFFF  ->  8388607
  0x800000  -> -8388608
  0xFFFFFF  -> -1

If num_channels > 1, decoded samples are grouped as frames:

  frame 0: CH0, CH1, CH2, ...
  frame 1: CH0, CH1, CH2, ...

So for 16 channels, every 16 decoded 24-bit values becomes one CSV row.

Compile
-------
Open x64 Native Tools Command Prompt for VS, go to this folder, then run:

  build.bat

If your Npcap SDK is not in C:\npcap-sdk-1.16, edit build.bat.

Run receiver
------------
Run Command Prompt as Administrator:

  build\fast_udp_receiver.exe

Run live plot
-------------
Open a second terminal in the same folder:

  python scripts\plot_live.py output\samples.csv --channels 0
  python scripts\plot_live.py output\samples.csv --channels 0,1,2,3
  python scripts\plot_live.py output\samples.csv --channels all

Install matplotlib if needed:

  pip install matplotlib

Performance notes
-----------------
Writing every decoded sample to CSV can become the bottleneck at high data rates.
Use CSV decimation for high-speed streams. Example: csv_decimation = 100 writes
only every 100th complete multi-channel frame.

Common issues
-------------
wpcap.dll not found: reinstall Npcap with WinPcap API-compatible mode enabled.
LNK4272 x64/x86 conflict: use x64 Native Tools Command Prompt for VS.
No packets: run as Administrator, choose the right adapter, disable filters temporarily.
