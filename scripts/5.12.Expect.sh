#!/bin/bash
# 5.12. Expect-$ver
set -e

ver='5.45.4'
``
cd $LFS/sources
tar -xvf expect$ver.tar.gz
cd expect$ver
cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure
./configure --prefix=/tools       \
            --with-tcl=/tools/lib \
            --with-tclinclude=/tools/include
make
# make test
make SCRIPTS="" install
cd $LFS/sources
rm -rf expect$ver
