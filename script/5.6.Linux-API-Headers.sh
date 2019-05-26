#!/bin/bash
# 5.6. Linux-$ver API Headers

set -e

ver='4.20.12'

cd $LFS/sources
tar -xvf linux-$ver.tar.xz
cd linux-$ver
make mrproper
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include
cd $LFS/sources
rm -rf linux-$ver
