#!/bin/bash

ver='3.3.2'

cd /sources
tar -xvf bison-$ver.tar.xz
cd bison-$ver

./configure --prefix=/usr --docdir=/usr/share/doc/bison-$ver

make

make install

cd /sources
rm -rf bison-$ver
