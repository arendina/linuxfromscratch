#!/bin/bash
# 6.7. Linux-4.12.7 API Headers

ver='4.20.12'

cd /sources
tar -xvf linux-$ver.tar.xz
cd linux-$ver

make mrproper
make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include

cd /sources
rm -rf linux-$ver
