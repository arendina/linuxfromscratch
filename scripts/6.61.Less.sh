#!/bin/bash

ver='530'
tarball="less-$ver.tar.gz"
source_dir="less-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

./configure --prefix=/usr --sysconfdir=/etc

make

make install

cd /sources
rm -rf $source_dir
