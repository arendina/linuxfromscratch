#!/bin/bash
# 5.22. Findutils-$ver

tarball='findutils-4.6.0.tar.gz'
ver='4.6.0'


cd $LFS/sources
tar -xvf $tarball
cd findutils-$ver

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' gl/lib/*.c
sed -i '/unistd/a #include <sys/sysmacros.h>' gl/lib/mountlist.c
echo "#define _IO_IN_BACKUP 0x100" >> gl/lib/stdio-impl.h

./configure --prefix=/tools

make

# make check

make install

cd $LFS/sources
rm -rf findutils-$ver
