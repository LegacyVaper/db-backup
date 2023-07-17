#!/bin/bash

# Database credentials
declare -r DB_USER="USER"
declare -r DB_PASSWORD="PASSWORD"
declare -r DB_NAME="NAME"

# Backup dir
declare -r BACKUP_DIR="PATH-TO-DIR"

# Date format
declare -r DATE=$(date +%Y%m%d%H%M%S)

# Number of backups to keep
declare -r MAX_BACKUPS=3

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup file name
declare -r BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$DATE.sql"

# Backup the database
mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$BACKUP_FILE"

# Delete older backup files (keep maximum backups)
ls -t "$BACKUP_DIR/$DB_NAME-"* | tail -n +$((MAX_BACKUPS+1)) | xargs -d '\n' rm -f

# Output status message
echo "Database backup created: $BACKUP_FILE"
