# Holbertonschool.com Passive Reconnaissance Report

## Objective

The objective of this report is to gather publicly available information about the `holbertonschool.com` domain using passive reconnaissance methods, mainly through Shodan and DNS-related data. The goal is to identify IP addresses, subdomains, mail infrastructure, name servers, and visible technologies connected to the domain without performing any active attack.

## Target Domain

```text
holbertonschool.com
```

## Methodology

The reconnaissance was performed using passive information-gathering techniques. The main focus was to collect information that is publicly visible on the internet.

The tools and methods used include:

```text
Shodan
DNS lookups
Subdomain enumeration
A record lookup
MX record lookup
TXT record review
NS record review
```

No exploitation or unauthorized access was performed during this reconnaissance.

## IP Addresses and Ranges

The domain `holbertonschool.com` resolves to multiple public IPv4 addresses. These IP addresses represent public-facing infrastructure used by the domain.

Observed A records:

```text
holbertonschool.com -> 75.2.70.75
holbertonschool.com -> 99.83.190.102
```

These addresses are likely connected to the web hosting or traffic routing infrastructure used by the domain. Since the domain uses cloud-based services, the IP addresses may change over time.

## Name Server Information

The domain uses AWS DNS name servers. This shows that DNS hosting is managed through Amazon Web Services Route 53 or AWS-related DNS infrastructure.

Observed NS records:

```text
ns-1455.awsdns-53.org
ns-1619.awsdns-10.co.uk
ns-176.awsdns-22.com
ns-792.awsdns-35.net
```

This indicates that the domain depends on cloud-based DNS infrastructure instead of self-hosted DNS servers.

## Mail Infrastructure

The MX records show that `holbertonschool.com` uses Google mail servers for email delivery. This means the domain likely uses Google Workspace or Gmail-based mail infrastructure.

Observed MX records:

```text
1 aspmx.l.google.com
5 alt1.aspmx.l.google.com
5 alt2.aspmx.l.google.com
10 alt3.aspmx.l.google.com
10 alt4.aspmx.l.google.com
```

The lower priority number is preferred first. Therefore, `aspmx.l.google.com` is the primary mail exchanger, while the `alt` servers are backup mail servers.

## Subdomains

Several subdomains were discovered for `holbertonschool.com`. Subdomains can show different services, environments, applications, or platforms used by an organization.

Observed subdomains include:

```text
www.holbertonschool.com
read.holbertonschool.com
apply.holbertonschool.com
rails-assets.holbertonschool.com
staging-rails-assets-apply.holbertonschool.com
staging-apply-forum.holbertonschool.com
staging-apply.holbertonschool.com
apply-staging.holbertonschool.com
webflow.holbertonschool.com
blog.holbertonschool.com
support.holbertonschool.com
fr.holbertonschool.com
assets.holbertonschool.com
v1.holbertonschool.com
v2.holbertonschool.com
v3.holbertonschool.com
beta.holbertonschool.com
alpha.holbertonschool.com
help.holbertonschool.com
```

Some of these subdomains suggest different environments, such as production, staging, beta, and older versioned services.

## Technologies and Frameworks

Based on the collected public information, the domain appears to use several external services and technologies.

Observed technologies and services:

```text
AWS DNS infrastructure
Google mail infrastructure
Web hosting or CDN-style public IP routing
TXT records for domain verification
SPF email protection records
Multiple web application subdomains
```

The presence of subdomains such as `webflow.holbertonschool.com` may suggest the use of Webflow for web content or landing pages. The Google MX records show that Google infrastructure is used for email handling. AWS name servers show that DNS is hosted using AWS DNS services.

## TXT Records and Verification

The domain contains several TXT records. TXT records are often used for email security, domain verification, and third-party service validation.

Observed TXT record purposes include:

```text
SPF email policy
Google site verification
Apple domain verification
Dropbox domain verification
Intacct verification
Loader.io verification
Microsoft verification
```

These records show that the domain is connected with several external platforms and services.

## Security Notes

From a passive reconnaissance point of view, the most interesting findings are the number of subdomains and the presence of staging or testing-related names.

Examples:

```text
staging-apply.holbertonschool.com
apply-staging.holbertonschool.com
staging-apply-forum.holbertonschool.com
beta.holbertonschool.com
alpha.holbertonschool.com
```

Staging, beta, and alpha environments should be carefully monitored because they may sometimes have weaker security controls than production systems. However, this report does not confirm any vulnerability; it only identifies public information that may be useful for security review.

## Summary

The passive reconnaissance of `holbertonschool.com` shows that the domain uses cloud-based infrastructure and several third-party services. AWS appears to be used for DNS hosting, Google is used for mail services, and multiple subdomains are publicly visible.

The domain has public-facing web infrastructure, several subdomains, multiple verification TXT records, and mail security-related DNS records. These findings help describe the public attack surface of the domain from a passive reconnaissance perspective.

## Conclusion

This report collected publicly available information about `holbertonschool.com` using passive reconnaissance methods. No active exploitation or unauthorized testing was performed.

The collected data shows that the domain uses modern cloud and third-party services, including AWS DNS and Google mail infrastructure. The discovered subdomains and DNS records can help security teams understand the public exposure of the domain and review whether all visible services are expected and properly secured.
