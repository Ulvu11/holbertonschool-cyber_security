#!/bin/bash
tail -n 1000 auth.log | grep 'Accepted password for root' | head -n 1 | awk '{print $9}'
