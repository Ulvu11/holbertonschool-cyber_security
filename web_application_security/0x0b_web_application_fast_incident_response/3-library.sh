#!/bin/bash
attacker=$(grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ' logs.txt | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
grep "^$attacker " logs.txt | awk -F'"' '{print $6}' | sort | uniq -c | sort -nr | head -n 1 | awk '{$1=""; sub(/^ /,""); print}'
