Fast UDP Streamer for FPGA Ethernet Testing
==========================================

This is a C++/Npcap sender meant to be faster than Python/Scapy.
It precomputes all payloads and complete Ethernet/IP/UDP frames before sending.

It can send:
  1. A text file containing 16-bit hex values separated by spaces
  2. A generated sine wave
  3. A generated ramp function

Project structure
-----------------
  build.bat
  README.txt
  examples/example_hex16.txt
  include/*.hpp
  src/*.cpp

Requirements
------------
  - Windows
  - Npcap installed with "WinPcap API-compatible Mode" enabled
  - Npcap SDK extracted, default expected path: C:\npcap-sdk-1.16
  - Visual Studio Build Tools or Visual Studio Community with C++ tools

Compile
-------
Open "x64 Native Tools Command Prompt for VS".
Do not use the x86 prompt when linking with Lib\x64.

Go to this project folder, then run:

  build.bat

The output is:

  build\fast_udp_streamer.exe

Run
---
Run Command Prompt as Administrator, then:

  build\fast_udp_streamer.exe

The program asks for settings, lists Npcap adapters, and asks which adapter to use.
Choose the Ethernet adapter connected to the FPGA.

Default packet settings
-----------------------
  Destination MAC: 00:11:22:33:44:55
  Source MAC:      12:34:56:78:9A:BC
  Source IP:       192.168.1.10
  Destination IP:  192.168.1.100
  UDP source port: 5000
  UDP dest port:   1234

Text-file mode
--------------
Select payload mode 1.
The text file format is 16-bit hex words separated by whitespace.

Examples:
  12    -> one 16-bit value 0x0012
  1234  -> one 16-bit value 0x1234
  ABCD  -> one 16-bit value 0xABCD

Big-endian output:
  1234 -> 12 34

Little-endian output:
  1234 -> 34 12

The example file is:
  examples\example_hex16.txt

Sine-wave mode
--------------
Select payload mode 2.
Useful settings:
  Sine frequency [Hz]
  Sample rate [S/s]
  Number of channels
  Max UDP payload bytes
  Signed/unsigned
  Big/little endian

For a repeatable sine wave:
  sample_rate / sine_frequency must be an integer.

The generator creates interleaved channel samples:
  time sample 0: CH0, CH1, CH2, ...
  time sample 1: CH0, CH1, CH2, ...

Auto sine packing:
  If full sine waves fit in one packet, it packs as many complete waves as possible.
  If no full wave fits, it splits one complete wave over multiple packets.

Example for 16 channels, 16-bit, 1440 byte payload:
  one time sample = 16 * 2 = 32 bytes
  max time samples per packet = 1440 / 32 = 45

For 100 kHz at 2 MS/s:
  samples per wave = 20
  waves per packet = floor(45 / 20) = 2
  payload = 40 samples * 16 channels * 2 bytes = 1280 bytes

For 10 kHz at 2 MS/s:
  samples per wave = 200
  one full wave does not fit in 45 samples, so it is split over multiple packets.

Ramp mode
---------
Select payload mode 3.
The ramp creates one maximum-size UDP payload and repeats it.

Data-rate control
-----------------
The setting "Target PAYLOAD data rate [bps]" controls payload data rate, not full Ethernet line rate.

Examples:
  16-bit * 2 MS/s = 32 Mb/s:
    32000000

  16 channels * 16-bit * 2 MS/s = 512 Mb/s:
    512000000

Set data rate to 0 for as-fast-as-possible.

Continuous or repeated sending
------------------------------
Continuous = true:
  send until Ctrl+C

Continuous = false:
  send packet pattern repeat_count times

Performance notes
-----------------
This should be much faster than Scapy because it prebuilds all frames.
Windows is not a real-time OS, so exact microsecond timing is not guaranteed.
For high speed:
  - Use x64 build
  - Use /O2 optimization
  - Use max UDP payloads such as 1440 bytes
  - Use target_payload_rate_bps = 0 for max speed
  - Use a native PCIe Ethernet adapter if possible
  - Avoid USB Ethernet adapters for high-rate testing

Common problems
---------------
wpcap.dll not found:
  Reinstall Npcap with WinPcap API-compatible Mode enabled.

LNK4272 x64 conflicts with x86:
  Use x64 Native Tools Command Prompt for VS.

pcap.h not found:
  Download/extract Npcap SDK and edit build.bat NPCAP_SDK path.

Program does not send:
  Run as Administrator and choose the correct Npcap adapter.
