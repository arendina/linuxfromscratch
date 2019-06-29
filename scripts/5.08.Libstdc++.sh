#!/bin/bash
# 5.8. Libstdc++-$ver

set -e

ver='8.2.0'

cd $LFS/sources
tar -xvf gcc-$ver.tar.xz
cd gcc-$ver
mkdir -v build
cd       build
../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --prefix=/tools                 \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-threads     \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/$ver
make
make install
cd $LFS/sources
rm -rf gcc-$ver
