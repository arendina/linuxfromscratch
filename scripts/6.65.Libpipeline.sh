#!/bin/bash

pkgname='libpipeline'
pkgver='1.5.1'

tarball="$pkgname-$pkgver.tar.gz"
source_dir="$pkgname-$pkgver"

cd /sources
tar -xvf $tarball
cd $source_dir

./configure --prefix=/usr

make

# make check

make install

cd /sources
rm -rf $source_dir
