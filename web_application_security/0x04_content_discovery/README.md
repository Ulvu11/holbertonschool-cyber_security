# Web Content Discovery

## Overview

**Web Content Discovery** is the process of identifying web resources that are not immediately visible through a website's normal navigation.

These resources may include:

- Hidden directories
- Unlinked pages
- Backup files
- Configuration files
- API endpoints
- Administrative panels
- Development or staging environments
- Old versions of files
- Virtual hosts and subdomains

Examples:

```text
/admin/
/backup/
/uploads/
/api/
/dev/
/config.php.bak
/.env
/database.sql
```

A resource does not need to be linked from the homepage to exist on the server. Content discovery tools send requests for possible paths and analyze the server's responses.

---

## Why Content Discovery Matters

Hidden content may expose sensitive information or functionality.

Possible security risks include:

- Unauthorized access to administrative panels
- Information leakage
- Exposed backup archives
- Public configuration files
- Forgotten test environments
- Debug pages
- Undocumented API endpoints
- Old and vulnerable application versions
- Improperly protected files and directories

Content discovery helps security testers understand the application's **attack surface**.

> Only perform content discovery against systems you own or have explicit permission to test.

---

## Content Discovery vs Vulnerability Scanning

Content discovery and vulnerability scanning are related, but they are not the same.

### Content Discovery

Content discovery answers questions such as:

```text
Does /admin/ exist?
Is there a backup.zip file?
Is an API endpoint available?
Is a hidden virtual host configured?
```

### Vulnerability Scanning

Vulnerability scanning answers questions such as:

```text
Is the web server outdated?
Are dangerous HTTP methods enabled?
Are security headers missing?
Is a known vulnerable component installed?
```

A discovered resource is not automatically a vulnerability. It must be manually reviewed.

---

## Directory Bruteforcing

**Directory bruteforcing** is the process of testing possible file and directory names against a web server.

A tool reads entries from a wordlist:

```text
admin
login
backup
uploads
api
```

It then requests:

```text
https://target.example/admin
https://target.example/login
https://target.example/backup
https://target.example/uploads
https://target.example/api
```

The server's HTTP responses are used to determine whether a resource may exist.

This is not password cracking. The word "bruteforce" refers to trying many possible path names.

---

## Common HTTP Status Codes

| Status Code | Meaning | Security Testing Interpretation |
|---|---|---|
| `200 OK` | Request succeeded | The resource probably exists |
| `204 No Content` | Request succeeded without a body | An endpoint may exist |
| `301 Moved Permanently` | Permanent redirect | Often indicates a directory or moved resource |
| `302 Found` | Temporary redirect | May redirect to login or another page |
| `307 Temporary Redirect` | Temporary redirect preserving method | Resource may exist |
| `401 Unauthorized` | Authentication required | Resource exists but requires authentication |
| `403 Forbidden` | Access denied | Resource often exists but access is blocked |
| `404 Not Found` | Resource not found | Usually means the path does not exist |
| `405 Method Not Allowed` | HTTP method is not accepted | Resource may exist, but the chosen method is blocked |
| `429 Too Many Requests` | Rate limit reached | Reduce request speed |
| `500 Internal Server Error` | Server-side error | Input may have triggered unexpected behavior |

Status codes alone are not always reliable. Some applications return `200 OK` for every invalid path. This behavior is often called a **soft 404**.

Compare response length, words, lines, headers, redirects, and page content—not only the status code.

---

## Wordlists

A **wordlist** is a collection of possible resource names.

Example:

```text
admin
administrator
dashboard
login
backup
old
test
dev
api
uploads
```

Wordlists make discovery faster because the scanner tests realistic names instead of every possible character combination.

### Wordlist Types

- Directory names
- File names
- File extensions
- API endpoints
- Subdomains
- Virtual hosts
- CMS-specific paths
- Technology-specific paths

Common wordlist collections include **SecLists** and the wordlists installed with tools such as DIRB.

Choose a wordlist that matches the target technology and the purpose of the assessment.

---

# Main Tools

## Gobuster

Gobuster is a command-line enumeration tool commonly used for:

- Directories and files
- DNS subdomains
- Virtual hosts
- Fuzzing
- Cloud storage names

### Directory Discovery

```bash
gobuster dir   -u http://target.example   -w /usr/share/seclists/Discovery/Web-Content/common.txt
```

### Search for File Extensions

```bash
gobuster dir   -u http://target.example   -w /usr/share/seclists/Discovery/Web-Content/common.txt   -x php,html,txt,bak
```

### Virtual Host Discovery

```bash
gobuster vhost   -u http://target.example   -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt
```

Gobuster is a good choice when fast, simple, mode-based enumeration is required.

---

## DirBuster

DirBuster is a Java-based content discovery tool with a graphical interface.

It can:

- Discover hidden files and directories
- Use custom wordlists
- Test file extensions
- Perform recursive discovery
- Adjust thread count
- Display results in a GUI

DirBuster works by trying wordlist entries as paths and reporting the paths that appear to exist.

It is useful for beginners who prefer a graphical interface, although modern command-line tools are often faster and easier to automate.

---

## Feroxbuster

Feroxbuster is designed for fast and recursive web content discovery.

### Basic Scan

```bash
feroxbuster   -u http://target.example   -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt
```

### Scan with Extensions

```bash
feroxbuster   -u http://target.example   -w /usr/share/seclists/Discovery/Web-Content/raft-medium-words.txt   -x php html txt bak
```

### Recursive Discovery

Suppose Feroxbuster finds:

```text
/admin/
```

It may continue searching inside that directory:

```text
/admin/login
/admin/users
/admin/backup/
```

If it then finds `/admin/backup/`, it may also inspect deeper paths:

```text
/admin/backup/database.sql
/admin/backup/config.zip
```

Recursive depth should be controlled to avoid excessive traffic and very long scans.

Feroxbuster is an excellent option for deep directory structures.

---

## Burp Suite

Burp Suite is a web application security testing platform.

For content discovery, it can help with:

- Intercepting HTTP requests
- Crawling the application
- Mapping endpoints
- Reviewing the site tree
- Modifying requests
- Fuzzing paths and parameters with Intruder
- Discovering hidden parameters
- Comparing application responses

Example Intruder target:

```http
GET /FUZZ HTTP/1.1
Host: target.example
```

The `FUZZ` position is replaced with entries from a payload list.

Burp Suite is especially useful when content discovery must be combined with manual request analysis.

---

## OWASP ZAP

OWASP ZAP is an open-source web application security testing tool.

Useful content discovery features include:

- Traditional Spider
- AJAX Spider
- Forced Browse
- Site Tree
- Passive scanning
- Attack surface mapping
- Manual request editing

### Spider

The spider follows links found in HTML responses.

### AJAX Spider

The AJAX Spider uses browser-like behavior to discover content generated by JavaScript.

### Forced Browse

Forced Browse attempts to identify unlinked files and directories using wordlists.

ZAP is useful for combining crawling, forced browsing, passive analysis, and application mapping.

---

## Nikto

Nikto is mainly a web server scanner rather than a dedicated directory bruteforcing tool.

It may identify:

- Outdated web server software
- Dangerous or unnecessary files
- Missing security headers
- Information disclosure
- Unsafe HTTP methods
- Default files
- Server misconfigurations
- Interesting directories

### Basic Scan

```bash
nikto -h http://target.example
```

Nikto findings are leads, not always confirmed vulnerabilities. Review each result manually.

Nikto is not primarily an automated SQL injection testing tool.

---

## OWASP Amass

OWASP Amass focuses on external asset discovery and attack surface mapping.

It can assist with:

- Subdomain enumeration
- DNS data collection
- External asset discovery
- Infrastructure relationship mapping
- Organization-wide attack surface analysis

Example assets:

```text
example.com
api.example.com
dev.example.com
mail.example.com
vpn.example.com
staging.example.com
```

Amass is broader than directory discovery. It helps identify which hosts and domains may need further web testing.

---

# HTTP Methods During Discovery

Security testing may include checking which HTTP methods a server accepts.

## GET

Retrieves a resource.

```http
GET /admin HTTP/1.1
Host: target.example
```

## HEAD

Requests response headers without the full body.

```http
HEAD /admin HTTP/1.1
Host: target.example
```

HEAD may help confirm whether a resource exists while transferring less data.

## OPTIONS

Requests information about supported communication options.

```http
OPTIONS / HTTP/1.1
Host: target.example
```

The response may contain an `Allow` header:

```http
Allow: GET, POST, OPTIONS
```

## TRACE

TRACE asks the server to reflect the received request.

```http
TRACE / HTTP/1.1
Host: target.example
```

It is mainly intended for diagnostics. It is commonly disabled when unnecessary because it can expose request details in some configurations.

## DELETE

DELETE requests removal of a resource.

```http
DELETE /files/test.txt HTTP/1.1
Host: target.example
```

Unauthenticated or improperly authorized DELETE access can be dangerous.

Do not send destructive methods against real systems unless the assessment rules explicitly allow it and safe test resources are available.

## CONNECT

CONNECT requests a tunnel, most commonly through an HTTP proxy.

```http
CONNECT example.com:443 HTTP/1.1
Host: example.com:443
```

Incorrect proxy configuration may allow unauthorized tunneling.

## PATCH

PATCH requests a partial modification of a resource.

```http
PATCH /api/users/10 HTTP/1.1
Host: target.example
Content-Type: application/json

{"name":"Test"}
```

Improper authorization may allow unauthorized changes.

---

# Basic Discovery Workflow

## 1. Confirm Authorization

Before scanning, document:

- Target domain or IP address
- Allowed paths
- Allowed tools
- Allowed request rate
- Allowed testing hours
- Prohibited actions
- Whether destructive methods are permitted

## 2. Perform Manual Reconnaissance

Review:

- Homepage
- HTML source
- JavaScript files
- `robots.txt`
- `sitemap.xml`
- HTTP response headers
- Cookies
- Redirect behavior
- Error pages

Example:

```bash
curl -i http://target.example/
curl -i http://target.example/robots.txt
curl -i http://target.example/sitemap.xml
```

## 3. Crawl the Application

Use a browser, Burp Suite, or OWASP ZAP to identify linked content.

## 4. Run Wordlist-Based Discovery

Use Gobuster, Feroxbuster, DirBuster, or ZAP Forced Browse.

Start with a small wordlist and a reasonable request rate.

## 5. Test Relevant Extensions

Possible extensions include:

```text
.php
.asp
.aspx
.jsp
.html
.txt
.xml
.json
.bak
.old
.zip
.tar.gz
.sql
```

Only test extensions that make sense for the target technology.

## 6. Review Interesting Responses

Pay special attention to:

```text
200
204
301
302
307
401
403
405
500
```

Inspect:

- Response body
- Content length
- Headers
- Redirect target
- Authentication behavior
- Page title
- Error message

## 7. Check Recursively

Search inside discovered directories, but control depth and request volume.

## 8. Validate Manually

Do not report a finding based only on an automated scanner.

Confirm:

- The resource actually exists
- It is accessible
- It exposes sensitive information or functionality
- Authentication and authorization are correctly enforced
- The behavior is reproducible

## 9. Document Findings

A useful finding should include:

- URL
- HTTP method
- Status code
- Response evidence
- Security impact
- Reproduction steps
- Recommended remediation

---

# Example Finding

## Exposed Backup File

### URL

```text
https://target.example/backup.zip
```

### Evidence

```text
HTTP/1.1 200 OK
Content-Type: application/zip
Content-Length: 4521032
```

### Risk

The archive may expose application source code, credentials, database information, or internal configuration.

### Recommendation

- Remove backup files from the web root
- Store backups outside publicly accessible directories
- Rotate any exposed credentials
- Review server logs for unauthorized downloads
- Add deployment checks that prevent backup artifacts from being published

---

# False Positives and Common Problems

## Soft 404 Responses

Some servers return `200 OK` for nonexistent pages.

Test a random path:

```bash
curl -i http://target.example/this-path-should-not-exist-839274
```

Compare its response with discovered paths.

## Redirect Everything to Login

A server may redirect every request to `/login`.

Compare:

- Redirect location
- Response length
- Cookies
- Page body
- Behavior after authentication

## Rate Limiting

Symptoms:

```text
429 Too Many Requests
403 responses after many requests
Connection resets
CAPTCHA challenges
```

Reduce threads and request rate.

## Wildcard DNS

Every subdomain may resolve to the same server.

Test a random hostname:

```text
random-name-928374.example.com
```

If it resolves, filter wildcard responses during subdomain enumeration.

## CDN and WAF Interference

A CDN or Web Application Firewall may alter responses, block tools, or return generic pages.

Use slower scans and verify results manually.

---

# Defensive Recommendations

Organizations can reduce content discovery risks by:

- Removing unused files and directories
- Keeping backups outside the web root
- Disabling directory listing
- Enforcing authentication and authorization
- Restricting administrative interfaces
- Removing development and debug endpoints
- Using generic error messages
- Disabling unnecessary HTTP methods
- Avoiding server version disclosure
- Monitoring unusual path enumeration
- Applying rate limiting
- Reviewing deployment artifacts
- Maintaining an accurate asset inventory
- Testing applications before production deployment

Security through obscurity is not enough. A hidden path must still have proper access control.

---

# Tool Selection Guide

| Goal | Recommended Tool |
|---|---|
| Fast directory and file discovery | Gobuster |
| Deep recursive discovery | Feroxbuster |
| Graphical directory discovery | DirBuster |
| Manual HTTP analysis and fuzzing | Burp Suite |
| Open-source crawling and forced browsing | OWASP ZAP |
| Web server configuration review | Nikto |
| External subdomain and asset discovery | OWASP Amass |

---

# Safe Practice Environments

Practice only in legal environments such as:

- Your own local web applications
- Intentionally vulnerable virtual machines
- Authorized CTF platforms
- Training labs
- Systems covered by a written penetration testing agreement

Examples of suitable lab applications include deliberately vulnerable web applications and isolated CTF targets.

---

# Quick Reference

```bash
# Gobuster directory discovery
gobuster dir -u http://target.example -w wordlist.txt

# Gobuster with extensions
gobuster dir -u http://target.example -w wordlist.txt -x php,txt,bak

# Feroxbuster recursive discovery
feroxbuster -u http://target.example -w wordlist.txt

# Nikto web server scan
nikto -h http://target.example

# Request headers and body
curl -i http://target.example/

# Test supported methods safely
curl -i -X OPTIONS http://target.example/
```

---

# Key Takeaways

- Content discovery identifies hidden or unlinked web resources.
- Directory bruteforcing tests possible paths from a wordlist.
- Wordlists make discovery faster and more focused.
- `200`, `301`, `302`, `401`, and `403` responses may indicate valuable resources.
- Gobuster is fast and straightforward.
- Feroxbuster is strong for recursive discovery.
- Burp Suite and OWASP ZAP combine discovery with manual analysis.
- Nikto focuses more on web server security and configuration.
- OWASP Amass maps external assets and subdomains.
- TRACE, CONNECT, and DELETE may be reviewed as part of HTTP method testing.
- Automated results must always be manually verified.
- Authorization is required before testing any system.

---

## Legal and Ethical Notice

This material is intended for education, defensive security, authorized penetration testing, and legal CTF environments.

Do not scan or test websites, networks, or applications without explicit permission.
