#!/bin/bash

name='util-linux'
ver='2.33.1'

tarball="$name-$ver.tar.xz"
source_dir="$name-$ver"

cd /sources
tar -xvf $tarball
cd $source_dir

mkdir -pv /var/lib/hwclock

rm -vf /usr/include/{blkid,libmount,uuid}

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --docdir=/usr/share/doc/util-linux-2.33.1 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            --without-systemd    \
            --without-systemdsystemunitdir

make

# chown -Rv nobody .
# su nobody -s /bin/bash -c "PATH=$PATH make -k check"

make install

cd /sources
rm -rf $source_dir
