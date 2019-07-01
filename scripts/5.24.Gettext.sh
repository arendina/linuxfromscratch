#!/bin/bash
# 5.24. Gettext-$ver

ver='0.19.8.1'

cd $LFS/sources
tar -xvf gettext-$ver.tar.xz
cd gettext-$ver

cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared

make -C gnulib-lib
make -C intl pluralx.c
make -C src msgfmt
make -C src msgmerge
make -C src xgettext

cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin

cd $LFS/sources
rm -rf gettext-$ver
