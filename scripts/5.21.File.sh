#!/bin/bash
# 5.21. File-5.31

tarball='file-5.36.tar.gz'
ver='5.36'

cd $LFS/sources
tar -xvf $tarball
cd file-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf file-$ver
