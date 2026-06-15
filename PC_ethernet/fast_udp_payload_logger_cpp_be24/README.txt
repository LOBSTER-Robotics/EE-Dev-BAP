Fast UDP Payload Logger - C++ / Npcap
=====================================

This program captures incoming UDP packets and saves only the UDP payload.
There is no plotting and no GUI, so it is much faster than the earlier Python plotter.

This version uses NORMAL 24-bit byte order / big-endian when decoding to CSV:

  FF EE DD -> 0xFFEEDD

So the first byte is the most significant byte and the third byte is the least significant byte.

Output modes
------------

  1. Raw binary payload bytes
     Fastest. Writes only UDP payload bytes directly to output/payload.bin.

  2. Hex TXT
     Writes one UDP payload per line as hex bytes:
       FF EE DD 12 34 56 ...

  3. Decoded 24-bit big-endian CSV
     Decodes the incoming payload as 24-bit samples and writes:
       frame,ch0,ch1,...


24-bit normal byte order decoding
---------------------------------

Every 3 payload bytes become one 24-bit sample:

  b0 b1 b2

Normal/big-endian order:

  value = (b0 << 16) + (b1 << 8) + b2

Examples:

  FF EE DD -> 0xFFEEDD
  7F FF FF ->  8388607
  80 00 00 -> -8388608 if signed mode is enabled
  FF FF FF -> -1       if signed mode is enabled

If num_channels > 1, samples are treated as interleaved:

  frame 0: CH0, CH1, CH2, ...
  frame 1: CH0, CH1, CH2, ...


Performance recommendation
--------------------------

For maximum speed, use mode 1:

  Raw binary payload bytes

CSV and TXT are much slower because every byte/sample must be converted to text.

Recommended workflow:

  1. Capture raw binary at high speed.
  2. Decode/convert/plot it afterwards using the included Python tools.


Requirements
------------

Windows:
  - Npcap installed
  - Npcap installed with "WinPcap API-compatible Mode"
  - Npcap SDK extracted
  - Visual Studio C++ build tools

Recommended SDK path:

  C:\npcap-sdk-1.16

If your SDK is somewhere else, edit build.bat:

  set NPCAP_SDK=C:\npcap-sdk-1.16


Compile
-------

Open:

  x64 Native Tools Command Prompt for VS

Go to the project folder and build:

  build.bat

This creates:

  build\fast_udp_payload_logger.exe


Run
---

Run Command Prompt as Administrator.

Then:

  build\fast_udp_payload_logger.exe

The program asks for output mode, filters, stop limits, and adapter number.


Default filters
---------------

Defaults are:

  Source IP:       192.168.1.100
  Destination IP:  192.168.1.10
  UDP source port: 1234
  UDP dest port:   5000

MAC filters are disabled by default.

To disable a filter:
  - MAC/IP: leave empty
  - UDP port: use 0


Offline conversion and plotting
-------------------------------

Convert raw binary to CSV:

  python tools_convert_raw24_be_to_csv.py output\payload.bin output\samples.csv --channels 1

For 16 channels:

  python tools_convert_raw24_be_to_csv.py output\payload.bin output\samples.csv --channels 16

Plot directly from raw binary:

  python plot_raw24_be.py

Open plot_raw24_be.py and change these variables near the top:

  INPUT_FILE = "output/payload.bin"
  NUM_CHANNELS = 1
  CHANNELS_TO_PLOT = [0]
  START_POSITION = 0
  WAVE_LENGTH = 2000

START_POSITION selects where in the captured waveform to start.
WAVE_LENGTH selects how many frames/samples to display.


Common problems
---------------

wpcap.dll not found:
  Reinstall Npcap with WinPcap API-compatible mode enabled.

LNK4272 x64 conflicts with x86:
  Use "x64 Native Tools Command Prompt for VS".

pcap.h not found:
  Edit build.bat and set NPCAP_SDK to your actual Npcap SDK folder.

No packets captured:
  Run as Administrator.
  Choose the correct adapter.
  Temporarily disable IP/port filters.
  Confirm packets arrive using Wireshark.
