#!/bin/bash
find -path "$1" -perm -4000 2>/dev/null
