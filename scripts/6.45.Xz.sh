#!/bin/bash

ver='5.2.4'

cd /sources
tar -xvf xz-$ver.tar.xz
cd xz-$ver

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-$ver

make

# make check

make install

mv -v   /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin
mv -v /usr/lib/liblzma.so.* /lib
ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so

cd /sources
rm -rf xz-5.2.3
