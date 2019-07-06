#!/bin/bash

name='sysvinit'
ver='2.93'

tarball="$name-$ver.tar.xz"
source_dir="$name-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

patch -Np1 -i ../sysvinit-2.93-consolidated-1.patch

make

make install

cd /sources
rm -rf $source_dir
