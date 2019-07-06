#!/bin/bash

ver='5.0'

cd /sources
tar -xvf bash-$ver.tar.gz
cd bash-$ver

./configure --prefix=/usr                    \
            --docdir=/usr/share/doc/bash-5.0 \
            --without-bash-malloc            \
            --with-installed-readline

make

# chown -Rv nobody .

# su nobody -s /bin/bash -c "PATH=$PATH make tests"

make install

mv -vf /usr/bin/bash /bin

exec /bin/bash --login +h

cd /sources
rm -rf bash-$ver
