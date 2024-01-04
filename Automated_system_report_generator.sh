#!/bin/bash

# Create a timestamp for the filename
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Define the filename
filename="system_report_$timestamp.txt"

# Generate the report
{
    echo "System Report Generated on: $(date)"
    echo "---------------------------------------"
    echo "CPU Usage:"
    top -bn1 | head -10  # Gets a snapshot of the top processes
    echo "---------------------------------------"
    echo "Memory Usage:"
    free -h  # Shows human-readable memory usage
    echo "---------------------------------------"
    echo "Disk Space Usage:"
    df -h  # Shows human-readable disk space usage
    echo "---------------------------------------"
    echo "Running Processes:"
    ps -aux  # Lists all running processes
} > "$filename"

echo "System report saved as $filename"
