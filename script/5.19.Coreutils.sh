#!/bin/bash
# 5.19. Coreutils-$ver

set -e

ver='8.30'

cd $LFS/sources
tar -xvf coreutils-$ver.tar.xz
cd coreutils-$ver

./configure --prefix=/tools --enable-install-program=hostname

make

# make RUN_EXPENSIVE_TESTS=yes check

make install

cd $LFS/sources
rm -rf coreutils-$ver
