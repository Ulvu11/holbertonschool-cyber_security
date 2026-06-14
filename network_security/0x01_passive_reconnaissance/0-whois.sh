#!/bin/bash
whois "$1" | awk -F': ' '/^(Registrant|Admin|Tech) (Name|Organization|Street|City|State\/Province|Postal Code|Country|Phone|Phone Ext|Fax|Fax Ext|Email):/ { sub(/:/, "", $1); if ($1 ~ /Ext$/) $1=$1 ":"; printf "%s%s,%s", (n++ ? "\n" : ""), $1, $2 }' > "$1.csv"
