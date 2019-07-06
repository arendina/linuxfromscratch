#!/bin/bash

ver='2.2.53'

cd /sources
tar -xvf acl-$ver.tar.gz
cd acl-$ver

./configure --prefix=/usr         \
            --bindir=/bin         \
            --disable-static      \
            --libexecdir=/usr/lib \
            --docdir=/usr/share/doc/acl-2.2.53

make

make install

mv -v /usr/lib/libacl.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so

cd /sources
rm -rf acl-$ver
