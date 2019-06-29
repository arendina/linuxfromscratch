#!/bin/bash

ver='5.36'

cd /sources
tar -xvf file-$ver.tar.gz
cd file-$ver

./configure --prefix=/usr

make

# make check

make install

cd /sources
rm -rf file-$ver
