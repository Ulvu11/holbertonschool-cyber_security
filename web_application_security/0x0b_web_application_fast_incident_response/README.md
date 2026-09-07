# Web Application Fast Incident Response

## Overview

This project focuses on **Incident Response (IR)** for web application security incidents.

The goal is to investigate suspicious server activity, analyze logs, identify the source and impact of an attack, and apply a structured incident response process to reduce damage and restore normal operations.

The project introduces practical techniques used by security analysts and incident response teams to:

- Identify suspicious IP addresses.
- Detect possible Denial of Service (DoS) activity.
- Analyze web server log files.
- Determine targeted endpoints.
- Count and classify suspicious requests.
- Identify attacker tools or libraries from request patterns.
- Propose mitigation and recovery actions.
- Document evidence and findings clearly.

---

## Incident Response

Incident Response is the organized process used to detect, investigate, contain, remove, and recover from cybersecurity incidents.

The primary goal is to minimize the impact, cost, and business disruption caused by a security incident.

A typical incident response lifecycle includes:

1. **Preparation**
2. **Detection and Analysis**
3. **Containment**
4. **Eradication**
5. **Recovery**
6. **Post-Incident Review**

### Preparation

Before an incident occurs, organizations should prepare:

- Incident response procedures
- Roles and responsibilities
- Security monitoring tools
- Logging systems
- Backups
- Communication plans
- Escalation procedures

### Detection and Analysis

During this phase, analysts investigate alerts and logs to determine:

- What happened
- When it happened
- Which systems were affected
- Which users or IP addresses were involved
- Whether the activity is malicious
- The possible attack vector

### Containment

Containment limits the attack and prevents further damage.

Examples include:

- Blocking a malicious IP address
- Disabling a compromised account
- Isolating an affected host
- Restricting access to an affected service

### Eradication

Eradication removes the root cause of the incident.

Examples include:

- Removing malware
- Closing exploited vulnerabilities
- Deleting malicious accounts
- Removing attacker persistence
- Applying security patches

### Recovery

Recovery restores systems to normal operation.

This may include:

- Restoring services
- Monitoring systems for reinfection
- Re-enabling accounts
- Verifying system integrity

### Post-Incident Review

After the incident, the organization should review:

- What happened
- What worked
- What failed
- How detection can be improved
- How similar incidents can be prevented

---

## Log Analysis

Logs are one of the most important sources of evidence during incident response.

They can reveal:

- Source IP addresses
- Request timestamps
- Requested URLs
- HTTP methods
- Status codes
- User agents
- Authentication attempts
- Error messages
- Suspicious behavior

This project uses:

```text
logs.txt
```

as the main log file for analysis.

---

## Why Centralized Log Management Matters

Centralized logging provides a single place to collect and analyze events from multiple systems.

Benefits include:

- Faster investigation
- Easier searching
- Better visibility
- Correlation between events
- Improved incident detection
- Easier forensic analysis
- Better compliance support

---

## Network Security and Monitoring

Network security is used to prevent unauthorized access, misuse, and attacks against network resources.

Common monitoring techniques include:

- Traffic monitoring
- Intrusion Detection Systems (IDS)
- Endpoint Detection and Response (EDR)
- Firewalls
- Log monitoring
- Vulnerability scanners

---

## Intrusion Detection Systems

An Intrusion Detection System (IDS) monitors activity and generates alerts when suspicious behavior is detected.

An IDS can help detect:

- Brute-force attempts
- Port scanning
- Suspicious traffic
- Known attack signatures
- Abnormal network behavior

A **false positive** occurs when legitimate activity is incorrectly identified as malicious.

---

## Denial of Service (DoS)

A Denial of Service attack attempts to make a service unavailable by overwhelming it with traffic or requests.

Example:

```text
Normal user:
50 requests

Another user:
75 requests

Possible attacker:
15000 requests
```

A very large number of requests from one source may indicate a DoS attack.

A **Distributed Denial of Service (DDoS)** attack performs the same type of attack using many different systems or IP addresses.

---

## Task 0 - Identify the Attack Source

### Objective

Create a Bash script that identifies the IP address responsible for the highest number of requests in `logs.txt`.

The IP address with the most requests is considered the most likely source of the DoS attack.

### Required File

```text
0-attack_ip.sh
```

### Investigation Logic

The analysis follows this workflow:

```text
logs.txt
   |
   v
Extract IP addresses
   |
   v
Sort the IP addresses
   |
   v
Count how many times each IP appears
   |
   v
Sort counts from highest to lowest
   |
   v
Select the first result
   |
   v
Print only the IP address
```

---

## Useful Linux Commands

### `head`

Displays the beginning of a file.

```bash
head -n 10 logs.txt
```

This is useful for understanding the log structure before writing a script.

### `awk`

`awk` is useful for extracting fields from structured text.

For example:

```bash
awk '{print $1}' logs.txt
```

If the first field contains the source IP address, this command extracts the source IP from every log entry.

### `sort`

Sorts lines so identical values appear next to each other.

```bash
sort
```

### `uniq -c`

Counts repeated lines.

```bash
uniq -c
```

Example input:

```text
10.0.0.1
10.0.0.1
10.0.0.1
192.168.1.5
```

Example output:

```text
3 10.0.0.1
1 192.168.1.5
```

### `sort -nr`

Sorts numerical results from highest to lowest.

```bash
sort -nr
```

Options:

- `-n` = numerical sort
- `-r` = reverse order

### `head -n 1`

Displays only the first result.

```bash
head -n 1
```

After sorting request counts from highest to lowest, this selects the most active IP address.

---

## Example Analysis Pipeline

A typical analysis pipeline is:

```bash
awk '{print $1}' logs.txt | sort | uniq -c | sort -nr
```

This may produce output such as:

```text
12000 192.0.2.10
350 198.51.100.7
120 203.0.113.15
```

The first line represents the IP address with the highest number of requests.

The final script should output only the attacker IP address, not the request count.

---

## Bash Script Requirements

Scripts in this project should:

- Use Bash.
- Begin with:

```bash
#!/bin/bash
```

- Be executable.
- End with a newline.
- Follow the project style requirements.
- Be tested on Kali Linux.

To make a script executable:

```bash
chmod +x 0-attack_ip.sh
```

To run it:

```bash
./0-attack_ip.sh
```

---

## Security Concepts Covered

This project covers:

- Incident Response
- Cyber Risk Mitigation
- Incident Response Planning
- Log Monitoring
- Endpoint Detection and Response
- Intrusion Detection
- Network Security
- Vulnerability Scanning
- Attacker Behavior
- DoS and DDoS Attacks
- Forensic Analysis
- Web Application Security
- Security Event Investigation

---

## Reference Resources

- IBM - Incident Response  
  https://www.ibm.com/think/topics/incident-response

- SAFE - Cyber Risk Mitigation  
  https://safe.security/resources/insights/what-is-cyber-risk-mitigation/

- PECB - Cybersecurity Incident Response Plan  
  https://pecb.com/en/article/a-comprehensive-guide-to-cybersecurity-incident-response-plan

- SalvationDATA - Writing a Forensic Report  
  https://www.salvationdata.com/work-tips/write-a-forensic-report/

- MITRE ATT&CK Enterprise Matrix  
  https://attack.mitre.org/matrices/enterprise/

- Zluri - Identity Security Solutions  
  https://www.zluri.com/blog/identity-security-solutions

- Trellix - Endpoint Detection and Response  
  https://www.trellix.com/security-awareness/endpoint/what-is-endpoint-detection-and-response/

- eSecurity Planet - Log Monitoring  
  https://www.esecurityplanet.com/networks/what-is-log-monitoring/

- OWASP - Vulnerability Scanning Tools  
  https://owasp.org/www-community/Vulnerability_Scanning_Tools

---

## Conclusion

This project demonstrates how incident responders use log data to identify suspicious activity and reconstruct an attack.

The first task focuses on a fundamental security analysis technique:

> Finding the source generating the highest number of requests.

By combining simple Linux tools such as `awk`, `sort`, `uniq`, and `head`, large log files can be reduced into useful security intelligence.

These same concepts are commonly used in SOC, Blue Team, DFIR, SIEM, and Incident Response environments.
