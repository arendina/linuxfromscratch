#!/bin/bash

ver='1.16.1'

cd /sources
tar -xvf automake-$ver.tar.xz
cd automake-$ver

./configure --prefix=/usr --docdir=/usr/share/doc/automake-$ver

make

# make -j4 check

make install

cd /sources
rm -rf automake-$ver
