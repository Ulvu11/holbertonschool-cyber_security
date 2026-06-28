# Web Application Security Fundamentals

## Introduction

The web is one of the most important parts of modern technology. Web applications are used every day for banking, social media, online shopping, education, cloud services, dashboards, and many other platforms.

Because web applications are public, accessible, and connected to users, servers, APIs, and databases, they are also common targets for cyber attacks. To secure or test a web application, it is important to understand how the web works, how data moves between the client and the server, and where security weaknesses can appear.

This project introduces the fundamentals of web technology and web application security. It focuses on web architecture, HTTP communication, front-end and back-end interaction, stateful and stateless design, data types, OWASP Top Ten risks, and bug bounty programs.

---

## Learning Objectives

By the end of this project, the following topics should be understood and explained clearly:

* How the Web works
* Examples of Web Applications
* Web 1.0 vs Web 2.0 vs Web 3.0
* Progressive Web Applications
* Front-End and Back-End communication
* Stateful vs Stateless design
* Structured vs Unstructured data
* Web Application Security risks
* OWASP Top Ten vulnerabilities
* Bug bounty programs

---

## How the Web Works

The web works using communication between a client and a server.

A client is usually a web browser such as Firefox, Chrome, or Safari. The browser sends a request to a web server. The server processes the request and sends back a response, usually in the form of a web page, data, or an error message.

The main steps are:

1. The user enters a URL in the browser.
2. DNS resolves the domain name to an IP address.
3. The browser sends an HTTP or HTTPS request to the server.
4. The server processes the request.
5. The server sends back a response.
6. The browser displays the web page to the user.

Example:

```text
User -> Browser -> HTTP Request -> Web Server -> HTTP Response -> Web Page
```

---

## Basic Web Concepts

### IP Address

An IP address is a series of numbers used to identify a device on a network.

Example:

```text
192.168.1.10
```

### Protocol

A protocol is a set of rules used for sending and receiving data over a network.

Examples:

```text
HTTP
HTTPS
FTP
DNS
SSH
```

### Web Browser

A web browser is a program that communicates with a web server and displays web pages.

Examples:

```text
Firefox
Google Chrome
Safari
Microsoft Edge
```

### WWW

WWW stands for:

```text
World Wide Web
```

It is the system of websites and web pages accessed through the internet.

---

## HTML, CSS, and JavaScript

### HTML

HTML stands for:

```text
HyperText Markup Language
```

HTML is used to structure the content of a web page.

Example:

```html
<h1>Hello World</h1>
<p>This is a paragraph.</p>
```

### CSS

CSS stands for:

```text
Cascading Style Sheets
```

CSS is used to style web pages.

Example:

```css
body {
  background-color: white;
  color: black;
}
```

### JavaScript

JavaScript is used to make web pages interactive.

Example:

```javascript
alert("Hello World");
```

---

## URL Structure

A URL, or Uniform Resource Locator, is the address of a resource on the web.

Example:

```text
https://user@example.com:443/dashboard?id=10#section
```

Main parts of a URL:

```text
Scheme: https
User/Auth: user
Domain/Host: example.com
Port: 443
Path: /dashboard
Query String: ?id=10
Fragment: #section
```

---

## HTTP and HTTPS

### HTTP

HTTP stands for:

```text
HyperText Transfer Protocol
```

HTTP is the protocol used for communication between browsers and web servers.

### HTTPS

HTTPS stands for:

```text
HyperText Transfer Protocol Secure
```

HTTPS is the secure version of HTTP. It uses encryption to protect data during communication.

HTTP was developed by Tim Berners-Lee as part of the creation of the World Wide Web.

---

## HTTP Methods

HTTP methods define the action that the client wants to perform.

Common HTTP methods include:

```text
GET
POST
PUT
PATCH
DELETE
HEAD
OPTIONS
CONNECT
TRACE
```

Examples:

* `GET` is used to request data.
* `POST` is used to send data.
* `PUT` is used to update or replace data.
* `PATCH` is used to partially update data.
* `DELETE` is used to remove data.

---

## Front-End and Back-End Communication

The front-end is the part of the application that users see and interact with. It includes HTML, CSS, JavaScript, buttons, forms, dashboards, and pages.

The back-end is the server-side part of the application. It handles logic, authentication, databases, APIs, and security checks.

Communication usually happens through HTTP requests.

Example:

```text
Front-End Form -> HTTP POST Request -> Back-End Server -> Database -> Response
```

For example, when a user logs in:

1. The user enters username and password.
2. The front-end sends the data to the back-end.
3. The back-end checks the database.
4. The server responds with success or failure.
5. The browser shows the result.

---

## Web Applications

A web application is a software application that runs in a browser and communicates with a server.

Examples of web applications:

* Online banking platforms
* Social media websites
* E-commerce stores
* Customer support dashboards
* Admin portals
* Email platforms
* Cloud storage services
* Learning platforms

---

## Web 1.0 vs Web 2.0 vs Web 3.0

### Web 1.0

Web 1.0 was mostly static. Users could read information, but interaction was limited.

Example:

```text
Static websites
Read-only pages
Simple HTML pages
```

### Web 2.0

Web 2.0 introduced dynamic and interactive websites. Users can create content, comment, upload files, like posts, and communicate with other users.

Example:

```text
Social media
Blogs
YouTube
Online shopping
Interactive dashboards
```

### Web 3.0

Web 3.0 focuses on decentralization, blockchain, smart contracts, digital ownership, and user-controlled data.

Example:

```text
Blockchain applications
Decentralized applications
Smart contracts
Crypto wallets
```

---

## Progressive Web Applications

A Progressive Web Application, or PWA, is a web application that behaves like a mobile or desktop application.

PWAs can support features such as:

* Offline access
* Push notifications
* Fast loading
* Installation on a device
* App-like user experience

Examples:

```text
Twitter Lite
Pinterest PWA
Starbucks PWA
```

---

## Stateful vs Stateless

### Stateful

A stateful application remembers information about the user or session.

Example:

```text
A web application that stores user login sessions in a database
```

If a user logs in and the server remembers the session, the application is stateful.

### Stateless

A stateless application does not remember previous requests. Each request must contain all necessary information.

HTTP is considered a stateless protocol because each request is independent.

Example:

```text
Client sends token -> Server checks token -> Server responds
```

---

## Structured vs Unstructured Data

### Structured Data

Structured data is organized in a fixed format, usually inside tables, rows, and columns.

Examples:

```text
Names
Dates
Addresses
Phone numbers
Database records
```

### Unstructured Data

Unstructured data does not have a fixed format.

Examples:

```text
Text files
Images
Videos
Emails
Social media posts
Logs
Mobile activity data
IoT sensor data
```

---

## Web Application Security

Web application security is the practice of protecting websites, web apps, APIs, servers, users, and data from attacks.

Common goals of web application security:

* Protect user accounts
* Protect sensitive data
* Prevent unauthorized access
* Prevent data leaks
* Stop injection attacks
* Secure authentication and sessions
* Detect and fix vulnerabilities

---

## OWASP Top Ten

OWASP Top Ten is a list of the most common and critical web application security risks.

Important web security risks include:

### Injection

Injection happens when an attacker sends malicious input to an application and the application executes it as a command or query.

Examples:

```text
SQL Injection
NoSQL Injection
Command Injection
LDAP Injection
```

### Cross-Site Scripting

Cross-Site Scripting, or XSS, happens when an attacker injects malicious JavaScript into a web page.

### Broken Authentication

Broken authentication happens when login, password reset, or session management is not implemented securely.

### Broken Access Control

Broken access control happens when users can access resources or actions they should not be allowed to access.

Example:

```text
A normal user accessing an admin panel
```

### Security Misconfiguration

Security misconfiguration happens when servers, frameworks, headers, permissions, or services are configured insecurely.

### Vulnerable and Outdated Components

This happens when an application uses old libraries, frameworks, or plugins with known vulnerabilities.

### Identification and Authentication Failures

This includes weak passwords, insecure login systems, missing MFA, and poor session handling.

### Software and Data Integrity Failures

This happens when an application trusts unsafe updates, plugins, packages, or code without verification.

### Security Logging and Monitoring Failures

This happens when attacks are not logged, monitored, or detected properly.

### Server-Side Request Forgery

SSRF happens when an attacker tricks the server into making requests to internal or external systems.

---

## CORS

CORS stands for Cross-Origin Resource Sharing.

CORS is a browser security mechanism that controls whether a web page from one origin can request resources from another origin.

Example:

```text
https://site-a.com wants to access https://api.site-b.com
```

If CORS is misconfigured, attackers may be able to abuse cross-origin requests.

---

## Host Header Injection

Host Header Injection happens when an application trusts the `Host` header without proper validation.

Possible impacts include:

* Password reset poisoning
* Web cache poisoning
* Accessing private virtual hosts
* Host header bypass
* Redirect manipulation

Example of a Host header:

```http
Host: example.com
```

If the application uses this value insecurely, it may generate malicious links or route requests incorrectly.

---

## Bug Bounty Programs

A bug bounty program allows ethical hackers and security researchers to report vulnerabilities to an organization.

The organization reviews the report and may reward the researcher if the vulnerability is valid.

Benefits of bug bounty programs:

* Helps organizations find vulnerabilities before attackers do
* Encourages responsible disclosure
* Improves application security
* Allows researchers to practice legally and ethically

Popular bug bounty platforms include:

```text
HackerOne
Bugcrowd
Intigriti
YesWeHack
Synack
```

---

## Project Environment

This project is designed to be tested on:

```text
Kali Linux 2023.3
```

Required tools:

```text
curl
sqlmap
Firefox or another web browser
Terminal
OpenVPN or sandbox network access
```

Install curl:

```bash
sudo apt install curl
```

Check curl version:

```bash
curl --version
```

Install sqlmap:

```bash
sudo apt install sqlmap
```

Check sqlmap version:

```bash
sqlmap --version
```

---

## Target Setup

The target web application is available at:

```text
http://web0x00.hbtn/login
```

The domain should be added to the hosts file and pointed to the target IP address.

Example:

```bash
sudo bash -c "echo '<Target_IP> web0x00.hbtn' >> /etc/hosts"
```

Connectivity can be tested with:

```bash
curl http://web0x00.hbtn
```

Expected behavior:

```text
The server redirects the user to /home
```

---

## Project Requirements

General requirements:

* All scripts must be tested on Kali Linux 2023.3.
* All scripts must be exactly two lines long.
* The command `wc -l file` should print `2`.
* The IP range must be substituted with `$1`.
* All files must end with a new line.
* The first line of every script must be exactly:

```bash
#!/bin/bash
```

* A `README.md` file must exist at the root of the project folder.
* All files must be executable.
* Code style should follow the required project style checks.

---

## Why Files Should End With a New Line

Text files should end with a new line because many Unix/Linux tools expect lines to be properly terminated.

If a file does not end with a new line, tools such as `cat`, `wc`, `diff`, linters, and compilers may display warnings or behave unexpectedly.

A newline at the end of a file is considered good practice in Linux and software development.

---

## Ethical Notice

This project is for educational purposes and authorized lab environments only.

Web application testing should only be performed on systems where permission has been given. Unauthorized testing against real websites, servers, or networks is illegal and unethical.

The goal of this project is to understand web technologies, identify common vulnerabilities, and learn how to improve web application security.

---

## Summary

This module introduces the core concepts of web application security. It explains how the web works, how clients and servers communicate, how web applications are structured, and how attackers may exploit common weaknesses.

Understanding these fundamentals is important before performing penetration testing, vulnerability assessment, secure coding, or bug bounty research.

The main idea of this project is:

```text
You cannot secure what you do not understand.
```

