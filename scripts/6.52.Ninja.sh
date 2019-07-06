#!/bin/bash

tarball='ninja-1.9.0.tar.gz'
source_dir='ninja-1.9.0'

cd /sources
tar -xvf $tarball
cd $source_dir

sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc

python3 configure.py --bootstrap

# python3 configure.py
# ./ninja ninja_test
# ./ninja_test --gtest_filter=-SubprocessTest.SetWithLots

install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja

cd /sources
rm -rf $source_dir
