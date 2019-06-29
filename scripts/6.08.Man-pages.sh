#!/bin/bash
# 6.8. Man-pages-4.12

ver='4.16'

cd /sources
tar -xvf man-pages-$ver.tar.xz

cd man-pages-$ver
make install

cd /sources
rm -rf man-pages-$ver
