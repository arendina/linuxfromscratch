#!/bin/bash
# 5.32. Tar-$ver

set -e

ver='1.31'

cd $LFS/sources
tar -xvf tar-$ver.tar.xz
cd tar-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf tar-$ver
