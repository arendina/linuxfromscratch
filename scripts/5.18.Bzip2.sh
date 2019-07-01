#!/bin/bash
# 5.18. Bzip2-$ver

ver='1.0.6'

cd $LFS/sources
tar -xvf bzip2-$ver.tar.gz
cd bzip2-$ver

make

make PREFIX=/tools install

cd $LFS/sources
rm -rf bzip2-$ver
