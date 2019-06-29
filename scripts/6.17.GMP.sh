#!/bin/bash
# 6.17. GMP-6.1.2

ver='6.1.2'

cd /sources
tar -xvf gmp-$ver.tar.xz
cd gmp-$ver

cp -v configfsf.guess config.guess
cp -v configfsf.sub   config.sub

./configure --prefix=/usr    \
    --enable-cxx     \
    --disable-static \
    --docdir=/usr/share/doc/gmp-6.1.2

make
make html

# make check 2>&1 | tee gmp-check-log

# awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log

make install
make install-html

cd /sources
rm -rf gmp-$ver
