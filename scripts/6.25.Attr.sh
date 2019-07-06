#!/bin/bash

ver='2.4.48'

cd /sources
tar -xvf attr-$ver.tar.gz
cd attr-$ver

./configure --prefix=/usr     \
            --bindir=/bin     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.4.48

make

# make check

make install

mv -v /usr/lib/libattr.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so

cd /sources
rm -rf attr-$ver
