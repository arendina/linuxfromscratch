#!/bin/bash

# 2.2. Host System Requirements
echo "Checking host system requirements"
apt-get update
apt-get install -y build-essential bison texinfo
ln -fs bash /bin/sh
/vagrant/version-check.sh

# 2.4. Creating a New Partition
echo "Creating a New Partition"
sfdisk /dev/sdb < /vagrant/data/sdb.out

# 2.5. Creating a File System on the Partition
echo "Creating a File System on the Partition"
mkswap /dev/sdb1
mkfs -v -t ext4 /dev/sdb2

# 2.6. Setting The $LFS Variable
echo "Setting The $LFS Variable"
export LFS=/mnt/lfs

# 2.7. Mounting the New Partition
echo "Mounting the New Partition"
mkdir -pv $LFS
/sbin/swapon -v /dev/sdb1
mount -v -t ext4 /dev/sdb2 $LFS
cat >> /etc/fstab << EOF
/dev/sdb1 none swap defaults 0 0
/dev/sdb2 $LFS ext4 defaults 0 0
EOF

# 3.1. Introduction
echo "Preparing the sources"
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources
cp -rv /vagrant/sources $LFS
cp -rv /vagrant/scripts $LFS
cp -v /vagrant/lfs-{prepare,build,config}.sh $LFS
cp -v /vagrant/chroot.sh $LFS

# 4.2. Creating the $LFS/tools Directory
echo "Creating the $LFS/tools Directory"
mkdir -v $LFS/tools
ln -sv $LFS/tools /

# 4.3. Adding the LFS User
echo "Adding the LFS user"
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
cp -rv /home/vagrant/.ssh /home/lfs
chown -vR lfs:lfs $LFS
chown -vR lfs:lfs /home/lfs/.ssh
cat > /etc/sudoers.d/lfs << EOF
lfs ALL=(ALL) NOPASSWD:ALL
EOF
chmod -v 440 /etc/sudoers.d/lfs

# 4.4. Setting Up the Environment
echo "Setting up the environment"
cat > /home/lfs/.bash_profile << EOF
exec env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash
EOF
cat > /home/lfs/.bashrc << EOF
set +h
umask 022
LFS=$LFS
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
# MAKEFLAGS='-j 2'
export LFS LC_ALL LFS_TGT PATH MAKEFLAGS
EOF
chown -v lfs:lfs /home/lfs/.bash_profile
chown -v lfs:lfs /home/lfs/.bashrc
