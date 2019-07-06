#!/bin/bash

name='kbd'
ver='2.0.4'
tarball="$name-$ver.tar.xz"
source_dir=$name-$ver

cd /sources
tar -xvf $tarball
cd $source_dir

patch -Np1 -i ../kbd-2.0.4-backspace-1.patch

sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr --disable-vlock

make

# make check

make install

mkdir -v       /usr/share/doc/kbd-2.0.4
cp -R -v docs/doc/* /usr/share/doc/kbd-2.0.4

cd /sources
rm -rf $source_dir
