#!/bin/bash

ver='2.26'

cd /sources
tar -xvf libcap-$ver.tar.xz
cd libcap-$ver

sed -i '/install.*STALIBNAME/d' libcap/Makefile


make

make RAISE_SETFCAP=no lib=lib prefix=/usr install
chmod -v 755 /usr/lib/libcap.so.2.26

mv -v /usr/lib/libcap.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so

cd /sources
rm -rf libcap-$ver
