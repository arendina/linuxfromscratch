#!/bin/bash

ver='1.10'

tarball="gzip-$ver.tar.xz"
source_dir="gzip-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

./configure --prefix=/usr

make

# make check

make install

mv -v /usr/bin/gzip /bin

cd /sources
rm -rf $source_dir
