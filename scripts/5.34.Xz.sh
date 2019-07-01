#!/bin/bash

ver='5.2.4'

cd $LFS/sources
tar -xvf xz-$ver.tar.xz
cd xz-$ver

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf xz-$ver
