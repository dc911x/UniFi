# UniFi

UniFi scripts and other goodies

# Back-up your UniFi autobackup file

## Before you start

This script makes use of rclone and installs it but you need to manually go through the "rclone config" steps in the setup. There are many different sorts of cloudstorage providers provided in the rclone config. While many use the same settings some require additional steps especially on headless machines.

Please read up on [Rclone](https://rclone.org) and choose your cloud storage platform.

## Rclone config tips

[Rclone](https://rclone.org)

[Configuring rclone on a remote / headless machine](https://rclone.org/remote_setup/)

----------------

Rclone references **"remote:"** a lot, for example to list the top directory of most Cloudprovider you use

`rclone lsd remote:`

To list all the files you use

`rclone ls remote:`

the **"remote"** is actually **the name you choose for your connector** when running rclone config.
So if you name your connector OneDrive it will be

`rclone lsd OneDrive:`

If you name it UniFi-Backup it will be

`rclone lsd UniFi-Backup:`

That seems one of the biggest misconceptions from new users when using rclone and reading the docs.

----------------

Want to save your files in another place then the main directory? Just copy the path and add it behind the remote.

`rclone lsd remote:Documents/UniFi/Backup`

Always use `/` even when on Windows. 

## Unifi Backup Setup (unifi_backup_setup.sh)

`sudo wget https://raw.githubusercontent.com/dc911x/UniFi/master/unifi_backup_setup.sh -O /usr/local/bin/unifi_backup_setup.sh`

`sudo chmod +x /usr/local/bin/unifi_backup_setup.sh`

Run the script:

`sudo /usr/local/bin/unifi_backup_setup.sh`

## UniFi Backup (unifi_backup.sh) 

After running the setup edit unifi_backup.sh with your favorite editor and add the correct remote from Rclone and path where you want to save the .unf file.

`sudo nano -w /usr/local/bin/unifi_backup.sh`

exit by using "Ctrl + X" and Yes

**That's all folks!**
