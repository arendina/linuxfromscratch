#!/bin/bash

tarball='elfutils-0.176.tar.bz2'
source_dir='elfutils-0.176'

cd /sources
tar -xvf $tarball
cd $source_dir

./configure --prefix=/usr

make

# make check

make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig

cd /sources
rm -rf $source_dir
