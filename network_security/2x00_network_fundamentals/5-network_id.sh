#!/bin/bash
IFS="." read -ra list <<< "$1";IFS="." read -r a b c d <<< "$2"; n=0; for i in $a $b $c $d; do if (( i != 0 )); then printf "%s" "${list[$n]}"; else printf "0"; fi; if (( n != 3 )); then printf "."; fi; (( n += 1 )); done 
