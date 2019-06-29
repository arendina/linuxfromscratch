#!/bin/bash
# 5.16. Bash-$ver

set -e

ver='5.0'

cd $LFS/sources
tar -xvf bash-$ver.tar.gz
cd bash-$ver

./configure --prefix=/tools --without-bash-malloc

make

# make tests

make install

ln -sv bash /tools/bin/sh

cd $LFS/sources
rm -rf bash-$ver
