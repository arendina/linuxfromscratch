#!/bin/bash

tarball='meson-0.49.2.tar.gz'
source_dir='meson-0.49.2'

cd /sources
tar -xvf $tarball
cd $source_dir

python3 setup.py build

python3 setup.py install --root=dest
cp -rv dest/* /

cd /sources
rm -rf $source_dir
