#!/bin/bash
grep 'sshd' $1 | awk '{print $6}' | sort | uniq -c | sort -nr | head -n 20
