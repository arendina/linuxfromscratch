#!/bin/bash

tarball='gawk-4.2.1.tar.xz'
source_dir='gawk-4.2.1'

cd /sources
tar -xvf $tarball
cd $source_dir

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make

# make check

make install

mkdir -v /usr/share/doc/gawk-4.2.1
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-4.2.1

cd /sources
rm -rf $source_dir
