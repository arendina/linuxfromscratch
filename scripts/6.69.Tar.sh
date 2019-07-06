#!/bin/bash

name='tar'
ver='1.31'

tarball="$name-$ver.tar.xz"
source_dir="$name-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

sed -i 's/abort.*/FALLTHROUGH;/' src/extract.c

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin

make

# make check

make install
make -C doc install-html docdir=/usr/share/doc/$name-$ver

cd /sources
rm -rf $source_dir
