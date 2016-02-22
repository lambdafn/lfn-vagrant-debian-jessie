#!/bin/bash

# Make sure perl is available
apt-get -y install perl

# Mount the disk image
cd /tmp
mkdir /tmp/isomount
mount -t iso9660 -o loop /home/vagrant/linux.iso /tmp/isomount

# Install the drivers
cp /tmp/isomount/VMwareTools-*.gz /root
cd /root &&
    tar -zxvf VMwareTools*.gz &&
    ./vmware-tools-distrib/vmware-install.pl -d -f

# Ensure the HGFS driver is rebuilt following a kernel update
echo "answer AUTO_KMODS_ENABLED yes" | sudo tee -a /etc/vmware-tools/locations

# Cleanup
umount /tmp/isomount
rm -rf /tmp/isomount /home/vagrant/linux.iso /root/VMwareTools*.gz
