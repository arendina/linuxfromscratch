#!/bin/bash
# 5.20. Diffutils-$ver

ver='3.7'

cd $LFS/sources
tar -xvf diffutils-$ver.tar.xz
cd diffutils-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf diffutils-$ver
