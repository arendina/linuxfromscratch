#!/bin/bash

# 6.14. M4-$ver

ver='1.4.18'

cd /sources
tar -xvf m4-$ver.tar.xz
cd m4-$ver

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

./configure --prefix=/usr

make

# make check

make install

cd /sources
rm -rf m4-$ver
