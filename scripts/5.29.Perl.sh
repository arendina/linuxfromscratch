#!/bin/bash
# 5.30. Perl-$ver

ver='5.28.1'

cd $LFS/sources
tar -xvf perl-$ver.tar.xz
cd perl-$ver

sh Configure -des -Dprefix=/tools -Dlibs=-lm -Uloclibpth -Ulocincpth

make

cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/$ver
cp -Rv lib/* /tools/lib/perl5/$ver

cd $LFS/sources
rm -rf perl-$ver
