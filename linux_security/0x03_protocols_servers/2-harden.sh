#!/bin/bash

# 1. Find all world-writable directories across the system
# -type d : Look for directories only
# -perm -0002 : Look for world-writable permissions
# ! -type l : Exclude symbolic links to avoid errors
world_writable_dirs=$(find / -type d -perm -0002 ! -type l 2>/dev/null)

# If no world-writable directories are found, exit early
if [ -z "$world_writable_dirs" ]; then
    exit 0
fi

# 2. List the directories and fix their permissions to a more secure level
echo "$world_writable_dirs" | while read -r dir; do
    # Print the directory path as shown in the example output
    echo "$dir"
    
    # Remove the world-writable bit (o-w) to secure the directory
    chmod o-w "$dir" 2>/dev/null
done
