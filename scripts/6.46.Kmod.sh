#!/bin/bash

ver='26'

cd /sources
tar -xvf kmod-$ver.tar.xz
cd kmod-$ver

./configure --prefix=/usr          \
            --bindir=/bin          \
            --sysconfdir=/etc      \
            --with-rootlibdir=/lib \
            --with-xz              \
            --with-zlib

make

make install

for target in depmod insmod lsmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /sbin/$target
done

ln -sfv kmod /bin/lsmod

cd /sources
rm -rf kmod-$ver
