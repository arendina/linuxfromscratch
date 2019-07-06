#!/bin/bash

tarball='libffi-3.2.1.tar.gz'
source_dir='libffi-3.2.1'

cd /sources
tar -xvf $tarball
cd $source_dir

sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
    -i include/Makefile.in

sed -e '/^includedir/ s/=.*$/=@includedir@/' \
    -e 's/^Cflags: -I${includedir}/Cflags:/' \
    -i libffi.pc.in

./configure --prefix=/usr --disable-static --with-gcc-arch=native

make

# make check

make install

cd /sources
rm -rf $source_dir
