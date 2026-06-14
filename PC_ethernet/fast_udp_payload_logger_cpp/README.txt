Fast UDP Payload Logger - C++ / Npcap
=====================================

This program only captures incoming UDP payloads and saves them to a file.
There is no plotting and no GUI, so it is much faster than the Python plotter.

Output modes:
  1. Raw binary payload bytes - fastest. Writes UDP payload bytes directly.
  2. Hex TXT - one UDP payload per line as hex bytes.
  3. Decoded 24-bit LSB CSV - decodes b0 + (b1<<8) + (b2<<16).

For maximum speed, use mode 1 and convert offline later.

24-bit LSB decoding:
  b0 b1 b2 -> value = b0 + (b1 << 8) + (b2 << 16)
  Signed mode sign-extends bit 23.

Compile:
  Open x64 Native Tools Command Prompt for VS
  cd /d <this folder>
  build.bat

Run:
  Run Command Prompt as Administrator
  build\fast_udp_payload_logger.exe

Defaults:
  Source IP:       192.168.1.100
  Destination IP:  192.168.1.10
  UDP source port: 1234
  UDP dest port:   5000

Disable filters:
  MAC/IP: leave empty
  UDP port: use 0

Common issues:
  wpcap.dll missing: reinstall Npcap with WinPcap API-compatible mode.
  x64/x86 linker conflict: use x64 Native Tools Command Prompt.
  pcap.h missing: edit build.bat NPCAP_SDK path.
