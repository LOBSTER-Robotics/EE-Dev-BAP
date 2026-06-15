Fast UDP Payload Logger v2 - C++ / Npcap
========================================

This version adds a payload length mode.

Why this matters
----------------

Normal UDP payload size is defined by the UDP length field:

  UDP payload length = UDP length field - 8

So if Wireshark or the FPGA packet header says the UDP payload is 32 bytes,
the normal/correct UDP payload is 32 bytes.

If your FPGA physically transmits more bytes after that, those bytes are not
considered UDP payload by normal software/network stacks. They may be:

  - Ethernet padding
  - extra malformed bytes after the UDP datagram
  - extra bytes caused by a wrong IP total length or UDP length field

This logger can optionally save those extra captured bytes for debugging.


Payload length modes
--------------------

The program asks:

  Payload length mode:

    1 = strict UDP length
        Saves exactly UDP length - 8 bytes.
        This is correct for valid UDP packets.

    2 = rest of captured Ethernet frame
        Saves everything after the UDP header until the end of the captured frame.
        Use this to debug FPGA frames where the UDP length says 32 bytes but
        you believe more bytes are physically present.

    3 = rest of IP packet
        Saves everything after the UDP header until the end of the IP packet
        according to the IPv4 total length field.


Recommended debugging setup
---------------------------

To see whether extra bytes are physically captured:

  Output mode:
    1 = raw binary

  Payload length mode:
    2 = rest of captured Ethernet frame

This writes all bytes after the UDP header to:

  output/payload.bin

At the end, the program prints:

  Total UDP-header-reported payload bytes
  Total IP-after-UDP-header bytes
  Total captured-after-UDP-header bytes
  Saved payload bytes

If captured-after-UDP-header is larger than UDP-header-reported payload bytes,
then extra bytes are physically present in the captured Ethernet frame.

If they are the same, the PC/Npcap is not seeing extra bytes.


Important warning
-----------------

If the FPGA sends a wrong UDP length, many normal receivers will only process
the length reported in the UDP header. The correct fix is normally to fix the
FPGA UDP length field and IPv4 total length field.

For a 1440 byte UDP payload:

  UDP length       = 1440 + 8  = 1448
  IPv4 total len   = 20 + 8 + 1440 = 1468

For a 32 byte UDP payload:

  UDP length       = 32 + 8 = 40
  IPv4 total len   = 20 + 8 + 32 = 60


Compile
-------

Use x64 Native Tools Command Prompt for VS:

  build.bat


Run
---

Run as Administrator:

  build\fast_udp_payload_logger_v2.exe
