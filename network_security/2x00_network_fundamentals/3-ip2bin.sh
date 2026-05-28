#!/bin/bash
IFS='.' read -r a b c d <<< "$1"; n=1; for i in $a $b $c $d; do printf "%08d" "$(echo "obase=2;$i" | bc)"; if (( n != 4)); then printf "."; fi; (( n += 1)); done
