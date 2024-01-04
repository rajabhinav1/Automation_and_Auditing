#!/bin/bash

# Check if a log file path is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/logfile"
    exit 1
fi

logfile=$1

echo "Analyzing log file: $logfile"

# Function to extract and count occurrences
count_occurrences() {
    awk '{print $1}' "$logfile" | sort | uniq -c | sort -nr | head -10
}

# Most frequent IP addresses
echo "Most Frequent IP Addresses:"
count_occurrences

# Most frequent request URLs
echo "Most Frequent Request URLs:"
awk '{print $7}' "$logfile" | sort | uniq -c | sort -nr | head -10

# Count specific HTTP status codes like 404, 500
echo "HTTP Status Code Counts:"
grep -oE '" [0-9]{3} ' "$logfile" | awk '{print $2}' | sort | uniq -c | sort -nr
