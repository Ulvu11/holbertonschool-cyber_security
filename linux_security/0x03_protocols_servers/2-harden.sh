#!/bin/bash
find / -type d -perm -0002 ! -type l 2>/dev/null | tee /dev/tty | xargs -I {} chmod o-w "{}" 2>/dev/null
