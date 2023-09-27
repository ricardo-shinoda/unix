#!/bin/bash

# backup directory
backup_path="/home/ricardo"

# Directory Backup end location
external_storage="/mnt/backup"

# File format
date_format=$(date "+%d-%m-%Y")
final_archive="backup-$date_format.tar.gz"

# Log File saved
log_file="/var/log/daily-backup.log"
