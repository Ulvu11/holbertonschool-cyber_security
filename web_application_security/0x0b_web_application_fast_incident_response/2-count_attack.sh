#!/bin/bash
file=${1:-logs.txt}
grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ' $file | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $1}'
