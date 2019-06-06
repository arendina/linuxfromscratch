#!/bin/bash
# 5.30. Perl-$ver
set -e

ver='3.7,2'

cd $LFS/sources
tar -xvf Python-3.7.2.tar.xz
cd Python-$ver

sed -i '/def add_multiarch_paths/a \
return' setup.py

./configure --prefix=/tools --without-ensurepip

make

make install

cd $LFS/sources
rm -rf perl-$ver
