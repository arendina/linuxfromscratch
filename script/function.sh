#!/bin/bash

function find_tarball() {
    local tarball=`grep $1 wget-list | sed 's/.*\/\/.*\///' | grep $1`
    echo "$tarball"
}
