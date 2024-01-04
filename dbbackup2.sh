#!/bin/bash

# Database credentials and details
DB_USER="example_user"
DB_PASSWORD="example_password"
DB_NAME="example_database"
BACKUP_PATH="/var/backups/mysql"
BACKUP_FILE="$BACKUP_PATH/${DB_NAME}_$(date +"%Y-%m-%d").sql"

# Function to output error message and exit
error_exit() {
    echo "Error: $1"
    exit 1
}

# Perform the database backup
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE || error_exit "Failed to create database backup."

# Check if the backup file was created
[ -f $BACKUP_FILE ] || error_exit "Backup file not found."

# Check if the backup file is not empty
[ -s $BACKUP_FILE ] || error_exit "Backup file is empty."

# Report success
echo "Database backup was successful. File: $BACKUP_FILE"
