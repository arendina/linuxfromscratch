#!/bin/bash
# 5.23. Gawk-$ver
# set -e # make check generates an error
ver='4.2.1'

cd $LFS/sources
tar -xvf gawk-$ver.tar.xz
cd gawk-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf gawk-$ver
