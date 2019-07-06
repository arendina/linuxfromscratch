#!/bin/bash

ver='4.7'

cd /sources
tar -xvf sed-$ver.tar.xz
cd sed-$ver

sed -i 's/usr/tools/'                 build-aux/help2man
sed -i 's/testsuite.panic-tests.sh//' Makefile.in

./configure --prefix=/usr --bindir=/bin

make
make html

# make check

make install
install -d -m755           /usr/share/doc/sed-4.7
install -m644 doc/sed.html /usr/share/doc/sed-4.7

cd /sources
rm -rf sed-$ver
