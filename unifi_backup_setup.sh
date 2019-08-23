#!/usr/bin/env bash

# unifi_backup_setup.sh
# UniFi Back-up to cloudprovider using rclone
# by Jelle Revyn <https://www.jelle.revyn.xyz/>
# Version 1.0
# Last Updated 23/08/2019

# Read access to UniFi backup directory
sudo chmod -R 705 /var/lib/unifi/backup/

# Install rclone and go through the process for your cloud provider.
curl https://rclone.org/install.sh | sudo bash

# Configure rclone

rclone config

# Download backupfile
sudo wget https://raw.githubusercontent.com/dc911x/UniFi/master/unifi_backup.sh -O /usr/local/bin/unifi_backup.sh
sudo chmod +x /usr/local/bin/unifi_backup.sh

#Schedule cronjob to run unifi_backup.sh every Sunday at 23u45, please make sure your autobackup is set to sunday BEFORE 23u45 (10min before should be fine)
#Don't forget to edit unifi_backup.sh with the correct settings
sudo crontab -l | { cat; echo "45 23 * * 0 /usr/local/bin/unifi_backup.sh"; } | crontab -