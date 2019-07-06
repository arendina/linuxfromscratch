#!/bin/bash

ver='3.3'

cd /sources
tar -xvf grep-$ver.tar.xz
cd grep-$ver

./configure --prefix=/usr --bindir=/bin

make

# make -k check

make install

cd /sources
rm -rf grep-$ver
