#!/bin/bash
# 5.28. Make-4.2.1

set -e
ver='4.2.1'

cd $LFS/sources
tar -xvf make-$ver.tar.bz2
cd make-$ver

sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c

./configure --prefix=/tools --without-guile

make

# make check

make install

cd $LFS/sources
rm -rf make-$ver
