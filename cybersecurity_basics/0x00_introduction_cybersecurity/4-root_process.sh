#!/bin/bash
ps -u "$1" u | awk '$5 != 0 || $6 != 0'
