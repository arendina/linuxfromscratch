#!/bin/bash
# 5.32. Tar-$ver

set -e

ver='6.5'

cd $LFS/sources
tar -xvf texinfo-$ver.tar.xz
cd texinfo-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf texinfo-$ver
