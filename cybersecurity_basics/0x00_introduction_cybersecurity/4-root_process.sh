#!/bin/bash
ps -u "$1" -o user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,command | grep -vE "^[^ ]+[ ]+[0-9]+[ ]+[0-9.]+[ ]+[0-9.]+[ ]+0[ ]+0"
