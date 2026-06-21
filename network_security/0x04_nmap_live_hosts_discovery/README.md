Əlbəttə, sənə Nmap üçün həm gündəlik istifadədə karına gələcək, həm də öyrəndiklərini sistemləşdirəcək peşəkar bir README (Cheat Sheet) təqdim edirəm. Bu formatı kopyalayıb öz qeydlərinin arasına (məsələn, Notion, Obsidian və ya GitHub-a) əlavə edə bilərsən.

Nmap (Network Mapper) - Quick Reference Guide
📌 Overview
Nmap is an open-source tool used for network discovery and security auditing. It uses raw IP packets to determine what hosts are available on the network, what services (application name and version) those hosts are offering, what operating systems they are running, and what type of packet filters/firewalls are in use.

⚙️ Basic Syntax
Bash
￼
￼
nmap [Scan Type(s)] [Options] <target>
🎯 1. Target Specification
Define the targets you want to scan.

nmap 192.168.1.1 - Scan a single IP.

nmap 192.168.1.1 192.168.1.2 - Scan specific multiple IPs.

nmap 192.168.1.1-254 - Scan a range of IPs.

nmap 192.168.1.0/24 - Scan an entire subnet (CIDR notation).

nmap -iL targets.txt - Scan a list of targets from a file.

🔍 2. Host Discovery (Ping Scans)
Determine which hosts are alive without scanning ports.

-sn : Ping scan only (disables port scanning).

-Pn : Treat all hosts as online (skips host discovery / bypasses ping blocks).

-PS[portlist] : TCP SYN Ping (e.g., -PS22,80,443).

-PA[portlist] : TCP ACK Ping (useful for bypassing stateful firewalls).

-PE / -PP / -PM : ICMP Echo, Timestamp, and Netmask request discovery probes.

🚪 3. Scan Techniques
Methods to determine port states (Open, Closed, Filtered).

-sS : TCP SYN Scan (Default for root, stealthy/half-open).

-sT : TCP Connect Scan (Default without root privilege, completes 3-way handshake).

-sU : UDP Scan (Scans UDP ports like DNS, SNMP).

-sA : TCP ACK Scan (Used to map firewall rulesets, returns unfiltered or filtered).

-sX : XMAS Scan (Sends FIN, PSH, and URG flags; exploits RFC 793).

🔢 4. Port Specification
Control which ports to scan (Nmap scans the top 1000 ports by default).

-p 22 : Scan a single port.

-p 22,80,443 : Scan specific ports.

-p 1-1024 : Scan a range of ports.

-p- : Scan all 65,535 ports.

--top-ports 100 : Scan the 100 most common ports.

🧬 5. Service, OS & Advanced Detection
Gather deep intelligence about the target.

-sV : Probe open ports to determine service/version info.

-O : Enable OS fingerprinting (guesses the operating system).

-A : Aggressive Scan (Enables OS detection, version detection, script scanning, and traceroute).

⏱️ 6. Timing and Performance
Adjust the speed of the scan (0 is slowest, 5 is fastest).

-T0 : Paranoid (IDS evasion, very slow).

-T3 : Normal (Default).

-T4 : Aggressive (Fast, recommended for reliable networks).

-T5 : Insane (Very fast, might drop packets/miss ports).

💾 7. Output Formats
Save your scan results for later analysis.

-oN <file> : Normal output (Plain text).

-oX <file> : XML output (Useful for importing into tools like Metasploit).

-oG <file> : Grepable output (Easy to parse with grep, awk, etc.).

-oA <basename> : Outputs in all three major formats at once.

🛠️ 8. Nmap Scripting Engine (NSE)
Automate advanced tasks using built-in Lua scripts.

-sC : Run default, safe scripts.

--script vuln : Run scripts to check for known vulnerabilities.

--script smb-os-discovery : Run a specific script by name.

💡 Quick Examples for Daily Use
1. The "Quick & Dirty" Recon:

Bash
￼
￼
nmap -T4 -F 192.168.1.1
(Fast scan of the top 100 ports)

2. The "Stealthy Web Server" Scan:

Bash
￼
￼
nmap -sS -p 80,443 -Pn 192.168.1.1
(SYN scan strictly on web ports, skipping ping)

3. The "Full Audit" (Take a coffee break):

Bash
￼
￼
nmap -sC -sV -O -p- -T4 -oA full_audit 192.168.1.1
(Scans all ports, checks versions, runs default scripts, detects OS, and saves all outputs)
