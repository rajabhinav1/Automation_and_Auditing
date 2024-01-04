#!/bin/bash

# List of IPs or domain names to check
hosts=("192.168.1.1" "google.com" "example.com")

# Log file location
logfile="network_health.log"

# Function to send an email alert
send_email_alert() {
    subject="Network Health Alert"
    recipient="your_email@example.com"
    body="Ping to $1 failed at $(date)"
    echo "$body" | mail -s "$subject" "$recipient"
}

# Ping each host and log the result
for host in "${hosts[@]}"; do
    if ping -c 1 "$host" &> /dev/null; then
        # Ping successful
        echo "$(date): Ping to $host successful" >> "$logfile"
    else
        # Ping failed
        echo "$(date): Ping to $host failed" >> "$logfile"
        send_email_alert "$host"
    fi
done
