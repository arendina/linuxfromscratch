#!/bin/bash

tarball='openssl-1.1.1a.tar.gz'
source_dir='openssl-1.1.1a'

cd /sources
tar -xvf $tarball
cd $source_dir

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

make

# make test

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.1a
cp -vfr doc/* /usr/share/doc/openssl-1.1.1a

cd /sources
rm -rf $source_dir
