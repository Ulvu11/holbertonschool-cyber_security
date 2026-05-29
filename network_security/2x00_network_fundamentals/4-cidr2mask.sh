#!/bin/bash
n=$1; for i in 1 2 3 4; do if (( n >= 8 )); then printf "255"; (( n -= 8 )); elif (( n == 0 )); then printf "0"; else printf "%s" "$(( 256 - 2**(8-n) ))"; n=0; fi; if(( i != 4 )); then printf "."; fi; done;
