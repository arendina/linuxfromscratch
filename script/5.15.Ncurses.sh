#!/bin/bash
# 5.15. Ncurses-$ver

set -e

ver='6.1'

cd $LFS/sources
tar -xvf ncurses-$ver.tar.gz
cd ncurses-$ver

sed -i s/mawk// configure
./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite

make

make install

ln -s libncursesw.so /tools/lib/libncurses.so

cd $LFS/sources
rm -rf ncurses-$ver
