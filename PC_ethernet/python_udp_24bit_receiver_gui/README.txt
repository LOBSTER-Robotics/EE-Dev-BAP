Python UDP 24-bit Receiver GUI
==============================

This is a simple Tkinter GUI for receiving UDP packets, decoding the UDP payload
as 24-bit LSB/little-endian samples, and plotting live.

Install
-------

Run:

  pip install scapy matplotlib numpy

Run as Administrator on Windows.


Start
-----

Run:

  python udp_24bit_receiver_gui.py


Incoming sample format
----------------------

Every 3 payload bytes are decoded as one 24-bit sample:

  byte0 byte1 byte2

LSB byte order means:

  value = byte0 + (byte1 << 8) + (byte2 << 16)

If "Signed 24-bit" is enabled, bit 23 is sign-extended.

Examples:

  FF FF 7F ->  8388607
  00 00 80 -> -8388608
  FF FF FF -> -1


Multiple channels
-----------------

Samples are assumed to be interleaved:

  frame 0: CH0, CH1, CH2, ...
  frame 1: CH0, CH1, CH2, ...

Set "Number of channels" to match your FPGA stream.

Plot channels examples:

  0
  0,1,2,3
  all


Filters
-------

Empty MAC/IP fields disable that filter.

UDP port 0 disables that port filter.

Default filters:

  Source IP:       192.168.1.100
  Destination IP:  192.168.1.10
  UDP source port: 1234
  UDP dest port:   5000

For first debugging, you can disable filters:

  Source IP: empty
  Destination IP: empty
  UDP source port: 0
  UDP dest port: 0


Performance
-----------

Python live plotting will not handle very high throughput like hundreds of Mb/s.

For better performance:

  Plot only one channel.
  Increase Plot decimation, for example 10, 100, or 1000.
  Use a smaller Plot window.
  Disable filters only for debugging; filters help reduce CPU load.

If "Software drops" increases, Python cannot keep up with the packet rate.
