#!/bin/bash

echo "User Account and Permission Audit Report"
echo "----------------------------------------"

# List all users and their last login time
echo "User accounts and last login times:"
lastlog | awk '{ print $1, $3, $4, $5, $6, $7, $8, $9 }'

echo ""
echo "----------------------------------------"

# Directories to check for permissive files
directories=("/etc" "/var")

# File permission to check for (e.g., world-writable)
perm="-perm -o=w"

# Check for permissively permissioned files
echo "Checking for permissively permissioned files:"
for dir in "${directories[@]}"; do
    echo "Directory: $dir"
    find "$dir" $perm -type f -exec ls -l {} \;
done

echo ""
echo "Audit complete."
