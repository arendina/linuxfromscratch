#!/bin/bash

tarball='check-0.12.0.tar.gz'
source_dir='check-0.12.0'

cd /sources
tar -xvf $tarball
cd $source_dir

./configure --prefix=/usr

make

# make check

make install

sed -i '1 s/tools/usr/' /usr/bin/checkmk

cd /sources
rm -rf $tarball
