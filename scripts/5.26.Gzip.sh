#!/bin/bash
# 5.26. Gzip-$ver
set -e

ver='1.10'

cd $LFS/sources
tar -xvf gzip-$ver.tar.xz
cd gzip-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf gzip-$ver
