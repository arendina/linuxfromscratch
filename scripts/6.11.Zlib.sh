#!/bin/bash
# 6.11. Zlib-1.2.11
ver='1.2.11'

cd /sources
tar -xvf zlib-$ver.tar.xz
cd zlib-$ver

./configure --prefix=/usr

make

# make check
make install

mv -v /usr/lib/libz.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so

cd /sources
rm -rf zlib-$ver
