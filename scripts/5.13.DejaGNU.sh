#!/bin/bash
# 5.13. DejaGNU-$ver

ver='1.6.2'

cd $LFS/sources
tar -xvf dejagnu-$ver.tar.gz
cd dejagnu-$ver

./configure --prefix=/tools

make install

# make check

cd $LFS/sources
rm -rf dejagnu-$ver
