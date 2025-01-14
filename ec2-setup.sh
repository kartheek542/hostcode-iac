#! /bin/bash

# Creating a mount point /data
dev_name="/dev/xvde"
sudo mkfs -t ext4 $dev_name
sudo mkdir /data
sudo mount $dev_name /data
sudo cp /etc/fstab /etc/fstab.orig
dev_id=$(sudo blkid $dev_name | sed -Ee 's/^.* UUID="([^ ]+)" .*$/\1/g')
sudo echo "UUID=$dev_id /data ext4 defaults,nofail 0 2" >> /etc/fstab