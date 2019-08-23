#!/usr/bin/env bash

# unifi_backup.sh
# UniFi Back-up cron-job
# by Jelle Revyn <https://www.jelle.revyn.xyz/>
# Part of unifi_backup_setup.sh

# Backup directory path
UNIFIBACKUP_DIR=/var/lib/unifi/data/backup/autobackup/
# Rclone directory path
RCLONEBACKUP_DIR=remote:path

#Copy all files that are not older then a day and filter out autobackup.json
rclone --filter "- *.json" --max-age 1d copy ${UNIFIBACKUP_DIR} ${RCLONEBACKUP_DIR}