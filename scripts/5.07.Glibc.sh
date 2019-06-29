#!/bin/bash
# 5.7. Glibc-$ver

set -e

ver='2.29'

cd $LFS/sources
tar -xvf glibc-$ver.tar.xz
cd glibc-$ver
mkdir -v build
cd       build
../configure                             \
      --prefix=/tools                    \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2             \
      --with-headers=/tools/include
make
make install
cd $LFS/sources
rm -rf glibc-$ver
