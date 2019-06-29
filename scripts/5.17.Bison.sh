#!/bin/bash
# 5.17. Bison-$ver

# set -e # make check generates some errors

ver='3.3.2'

cd $LFS/sources
tar -xvf bison-$ver.tar.xz
cd bison-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf bison-$ver
