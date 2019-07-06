#!/bin/bash

tarball='diffutils-3.7.tar.xz'
source_dir='diffutils-3.7'

cd /sources
tar -xvf $tarball
cd $source_dir

./configure --prefix=/usr

make

# make check

make install

cd /sources
rm -rf $source_dir
