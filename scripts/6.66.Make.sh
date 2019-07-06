#!/bin/bash

name='make'
ver='4.2.1'
tarball="$name-$ver.tar.bz2"
source_dir="$name-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c

./configure --prefix=/usr

make

# make PERL5LIB=$PWD/tests/ check

make install

cd /sources
rm -rf $source_dir
