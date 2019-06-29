#!/bin/bash
# 5.25. Grep-$ver

set -e

ver='3.3'

cd $LFS/sources
tar -xvf grep-$ver.tar.xz
cd grep-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf grep-$ver
