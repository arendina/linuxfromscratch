#!/bin/bash
# 6.19. MPC-$ver

ver='1.1.0'

cd /sources
tar -xvf mpc-$ver.tar.gz
cd mpc-$ver

./configure --prefix=/usr    \
    --disable-static \
    --docdir=/usr/share/doc/mpc-1.1.0

make
make html

# make check

make install
make install-html

cd /sources
rm -rf mpc-$ver
