#!/bin/bash
# 5.29. Patch-$ver

ver='2.7.6'

cd $LFS/sources
tar -xvf patch-$ver.tar.xz
cd patch-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf patch-$ver
