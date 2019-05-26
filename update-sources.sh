#!/bin/bash

set -e

wget --continue http://linuxfromscratch.org/lfs/view/stable/wget-list --output-document=data/wget-list
wget --continue http://linuxfromscratch.org/lfs/view/stable/md5sums --output-document=data/md5sums

if [[ ! -d sources ]]; then
    echo "ERROR: sources directory does not exist"
    exit 1
fi

wget --input-file=data/wget-list --continue --directory-prefix=sources
pushd sources
md5sum --check ../data/md5sums
popd

