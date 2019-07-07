#!/bin/bash
# 8.4. Using GRUB to Set Up the Boot Process
grub-install --force /dev/sdb
cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod ext2
set root=(hd0,2)

menuentry "GNU/Linux, Linux 4.20.12-lfs-8.4" {
        linux   /boot/vmlinuz-4.20.12-lfs-8.4 root=/dev/sda2 ro
}
EOF
