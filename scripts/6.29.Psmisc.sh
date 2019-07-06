#!/bin/bash

ver='23.2'

cd /sources
tar -xvf psmisc-$ver.tar.xz
cd psmisc-$ver

./configure --prefix=/usr

make

make install

mv -v /usr/bin/fuser   /bin
mv -v /usr/bin/killall /bin

cd /sources
rm -rf psmisc-$ver
