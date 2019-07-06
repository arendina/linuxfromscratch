#!/bin/bash

name='procps-ng'
ver='3.3.15'

tarball="$name-$ver.tar.xz"
source_dir="$name-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

./configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.15 \
            --disable-static                         \
            --disable-kill

make

# sed -i -r 's|(pmap_initname)\\\$|\1|' testsuite/pmap.test/pmap.exp
# sed -i '/set tty/d' testsuite/pkill.test/pkill.exp
# rm testsuite/pgrep.test/pgrep.exp
# make check

make install

mv -v /usr/lib/libprocps.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so

cd /sources
rm -rf $source_dir
