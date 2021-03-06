#!/bin/bash

# 5.4. Binutils-2.32 - Pass 1

ver='2.32'

cd $LFS/sources
tar -xvf binutils-$ver.tar.xz
cd binutils-$ver

mkdir -v build
cd       build

../configure --prefix=/tools            \
             --with-sysroot=$LFS        \
             --with-lib-path=/tools/lib \
             --target=$LFS_TGT          \
             --disable-nls              \
             --disable-werror

make

case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

make install

cd $LFS/sources
rm -rf binutils-$ver
