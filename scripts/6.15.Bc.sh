#!/bin/bash

# 6.15. Bc-$ver

ver='1.07.1'

cd /sources
tar -xvf bc-$ver.tar.gz
cd bc-$ver

cat > bc/fix-libmath_h << "EOF"
#! /bin/bash
sed -e '1   s/^/{"/' \
    -e     's/$/",/' \
    -e '2,$ s/^/"/'  \
    -e   '$ d'       \
    -i libmath.h

sed -e '$ s/$/0}/' \
    -i libmath.h
EOF

ln -sv /tools/lib/libncursesw.so.6 /usr/lib/libncursesw.so.6
ln -sfv libncursesw.so.6 /usr/lib/libncurses.so

sed -i -e '/flex/s/as_fn_error/: ;; # &/' configure

./configure --prefix=/usr \
    --with-readline \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info

make

# echo "quit" | ./bc/bc -l Test/checklib.b

make install

cd /sources
rm -rf bc-$ver