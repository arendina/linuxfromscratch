#!/bin/bash
# 5.31. Sed-$ver

set -e

ver='4.7'

cd $LFS/sources
tar -xvf sed-$ver.tar.xz
cd sed-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf sed-$ver
