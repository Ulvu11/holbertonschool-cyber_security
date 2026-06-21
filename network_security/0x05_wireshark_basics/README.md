Here is the Wireshark README translated into English:

Wireshark - Network Protocol Analyzer
Wireshark is the world’s foremost and widely-used network protocol analyzer. It lets you see what’s happening on your network at a microscopic level and is the de facto standard for network troubleshooting, analysis, software and communications protocol development, and education.

Key Features
Deep Inspection: Deep inspection of hundreds of network protocols, with new ones being added constantly.

Live Capture and Offline Analysis: Monitor traffic in real-time or analyze previously recorded capture files.

Multi-Platform: Runs on Windows, macOS, Linux, Solaris, FreeBSD, NetBSD, and many other operating systems.

Powerful Filtering: Use the most powerful display filters in the industry to easily find the exact packet you need.

Broad Format Support: Can read and write dozens of different capture file formats, including tcpdump (libpcap), Pcap NG, Sniffer Pro, and NetXray.

Decryption: Decryption support for many protocols, including IPsec, ISAKMP, Kerberos, SNMPv3, SSL/TLS, WEP, and WPA/WPA2.

Installation
Installation steps based on your operating system:

Windows and macOS:
Download the installer from the official Wireshark download page and follow the standard setup process.
Note: Windows users must allow the installation of the "Npcap" component during setup to enable packet capturing.

Linux (Debian/Ubuntu example):
Execute the following commands in your terminal:

Bash
￼
￼
sudo apt update
sudo apt install wireshark
Basic Usage (Quick Start)
Follow these steps to start analyzing network traffic:

Launch the program: Open Wireshark. (On Linux, you may need to run the program with sudo or add your user account to the wireshark group to view available interfaces).

Select an interface: On the main screen, select the network interface you want to monitor (e.g., Wi-Fi or Ethernet) and double-click on it.

Monitor the data: Packets will begin to appear as a list on your screen in real-time.

Apply a filter: To avoid getting lost among thousands of packets, type a filter into the "Apply a display filter" bar at the top and press Enter. For example:

For HTTP traffic only: http

For traffic to/from a specific IP address: ip.addr == 192.168.1.1

For DNS queries only: dns

Stop capturing: Click the red square (Stop) button in the top left corner to halt the capture process so you can comfortably inspect the gathered packets.

⚠️ Security and Ethics Warning: Wireshark is a highly powerful tool that operates at the packet level. Monitoring and analyzing network traffic is legally permissible only on your personal network or on networks where you have explicit permission from the owner. Sniffing traffic on unauthorized networks (such as public Wi-Fi in cafes) is a violation of privacy and may be prosecuted as a cybercrime.
