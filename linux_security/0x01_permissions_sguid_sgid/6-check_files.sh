#!/bin/bash
find "$1" -mtime -1 \(-perm -2000 -o -perm -4000 \) -exec ls -la {} \; 2>/dev/null
