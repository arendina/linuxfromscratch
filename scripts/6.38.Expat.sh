#!/bin/bash

ver='2.2.6'

cd /sources
tar -xvf expat-$ver.tar.bz2
cd expat-$ver

sed -i 's|usr/bin/env |bin/|' run.sh.in

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.2.6

make

# make check

make install

install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.6

cd /sources
rm -rf expat-$ver