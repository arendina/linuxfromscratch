#!/bin/bash

tarball='groff-1.22.4.tar.gz'
source_dir='groff-1.22.4'

cd /sources
tar -xvf $tarball
cd $source_dir

PAGE=A4 ./configure --prefix=/usr

make -j1

make install

cd /sources
rm -rf $source_dir
