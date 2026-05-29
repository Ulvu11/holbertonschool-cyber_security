#!/bin/bash
IFS="." read -ra ip <<< "$1";IFS="." read -ra mask <<< "$2"; for i in 0 1 2 3 ; do printf "%s" "$(( ${ip[$i]} & ${mask[$i]} ))"; if (( i != 3 )); then printf "."; fi; done
