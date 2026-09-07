#!/bin/bash
grep 'useradd' auth.log | grep 'new user:' | awk -F'name=' '{print $2}' | cut -d',' -f1 | sort | paste -sd, -
