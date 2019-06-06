#!/bin/bash
# 5.11. Tcl-core-$ver

set -e

ver='8.6.9'

cd $LFS/sources
tar -xvf tcl$ver-src.tar.gz

cd tcl$ver
cd unix
./configure --prefix=/tools
make

# TZ=UTC make test

make install

chmod -v u+w /tools/lib/libtcl8.6.so
make install-private-headers
ln -sv tclsh8.6 /tools/bin/tclsh

cd $LFS/sources
rm -rf tcl$ver
