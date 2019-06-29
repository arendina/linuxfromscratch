#!/bin/bash
# 6.16. Binutils-$ver

ver='2.32'

cd /sources
tar -xvf binutils-$ver.tar.xz
cd binutils-$ver

expect -c "spawn ls"

mkdir -v build
cd build

../configure --prefix=/usr  \
    --enable-gold           \
    --enable-ld=default     \
    --enable-plugins        \
    --enable-shared         \
    --disable-werror        \
    --enable-64-bit-bfd     \
    --with-system-zlib

make tooldir=/usr

# make -k check

make tooldir=/usr install

cd /sources
rm -rf binutils-$ver
