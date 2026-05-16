#!/bin/bash
find . -type d -perm -0002 | xargs -I {} sh -c 'echo "{}"; chmod o-w "{}"'
