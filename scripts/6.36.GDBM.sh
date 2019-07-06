#!/bin/bash

ver='1.18.1'

cd /sources
tar -xvf gdbm-$ver.tar.gz
cd gdbm-$ver

./configure --prefix=/usr \
            --disable-static \
            --enable-libgdbm-compat

make

# make check

make install

cd /sources
rm -rf gdbm-$ver
