#!/bin/bash
# 6.18. MPFR-$ver

ver='4.0.2'

cd /sources
tar -xvf mpfr-$ver.tar.xz
cd mpfr-$ver

./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.0.2

make
make html

# make check

make install
make install-html

cd /sources
rm -rf mpfr-$ver
