#!/bin/bash

name='linux'
ver='4.20.12'
lfs_ver='8.4'

tarball="$name-$ver.tar.xz"
source_dir="$name-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

make mrproper

make defconfig

make

make modules_install

cp -v arch/x86/boot/bzImage /boot/vmlinuz-$ver-lfs-$lfs_ver

cp -v System.map /boot/System.map-$ver

cp -v .config /boot/config-$ver

install -d /usr/share/doc/linux-$ver
cp -r Documentation/* /usr/share/doc/linux-$ver

# tar -cvf /linux.tar -C /sources linux-$ver
install -v -m755 -d /etc/modprobe.d

cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF

cd /sources
rm -rf $source_dir
