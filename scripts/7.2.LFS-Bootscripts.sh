#!/bin/bash

name='lfs-bootscripts'
ver='20180820'

tarball="$name-$ver.tar.bz2"
source_dir="$name-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

make install

cd /sources
rm -rf $source_dir
