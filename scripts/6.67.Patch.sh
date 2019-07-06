#!/bin/bash

name='patch'
ver='2.7.6'

tarball="$name-$ver.tar.xz"
source_dir="$name-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

./configure --prefix=/usr && make && make install

# make check

cd /sources
rm -rf $source_dir
