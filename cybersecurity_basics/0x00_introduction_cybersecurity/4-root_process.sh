#!/bin/bash
ps -u "$1" -o user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,command | awk '$5 != 0 { if ($6 != 0) print }'
