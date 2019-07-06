#!/bin/bash

ver='4.20.0'

tarball="iproute2-$ver.tar.xz"
source_dir="iproute2-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

sed -i 's/.m_ipt.o//' tc/Makefile

make

make DOCDIR=/usr/share/doc/iproute2-4.20.0 install

cd /sources
rm -rf $source_dir
