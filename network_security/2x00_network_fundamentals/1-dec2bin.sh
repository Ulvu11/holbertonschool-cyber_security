#!/bin/bash
n=$1; for bit in 128 64 32 16 8 4 2 1; do if (( n >= bit )); then printf "1"; ((n -= bit)); else printf "0"; fi; done;
