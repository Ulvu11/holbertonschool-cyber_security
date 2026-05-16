#!/bin/bash
find / -type d -perm -0002 ! -type l 2>/dev/null -print -exec chmod o-w {} + 2>/dev/null
