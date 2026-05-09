#!/bin/bash
echo "$2  $1" | sha256sum --check --status
if [ $? -eq 0 ]; then echo "$1: OK"; fi
