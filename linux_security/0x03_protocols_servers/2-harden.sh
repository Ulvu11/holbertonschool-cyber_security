#!/bin/bash
find / -type d -perm -0002 2>/dev/null | xargs -I {} sh -c 'echo "{}"; chmod o-w "{}"'
