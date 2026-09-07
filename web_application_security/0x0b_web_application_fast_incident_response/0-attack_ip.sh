#!/bin/bash
grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ' logs.txt | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'
