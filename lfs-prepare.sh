#!/bin/bash

time ($LFS/script/5.04.Binutils-Pass-1.sh && \
    $LFS/script/5.05.GCC-Pass-1.sh && \
    $LFS/script/5.06.Linux-API-Headers.sh && \
    $LFS/script/5.07.Glibc.sh && \
    $LFS/script/5.08.Libstdc++.sh && \
    $LFS/script/5.09.Binutils-Pass-2.sh && \
    $LFS/script/5.10.GCC-Pass-2.sh && \
    $LFS/script/5.11.Tcl.sh && \
    $LFS/script/5.12.Expect.sh && \
    $LFS/script/5.13.DejaGNU.sh && \
    $LFS/script/5.14.M4.sh && \
    $LFS/script/5.15.Ncurses.sh && \
    $LFS/script/5.16.Bash.sh && \
    $LFS/script/5.17.Bison.sh && \
    $LFS/script/5.18.Bzip2.sh && \
    $LFS/script/5.19.Coreutils.sh && \
    $LFS/script/5.20.Diffutils.sh && \
    $LFS/script/5.21.File.sh && \
    $LFS/script/5.22.Findutils.sh && \
    $LFS/script/5.23.Gawk.sh && \
    $LFS/script/5.24.Gettext.sh && \
    $LFS/script/5.25.Grep.sh && \
    $LFS/script/5.26.Gzip.sh && \
    $LFS/script/5.27.Make.sh && \
    $LFS/script/5.28.Patch.sh && \
    $LFS/script/5.29.Perl.sh && \
    $LFS/script/5.30.Python.sh && \
    $LFS/script/5.31.Sed.sh && \
    $LFS/script/5.32.Tar.sh && \
    $LFS/script/5.33.Texinfo.sh && \
    $LFS/script/5.34.Xz.sh \
) 2>&1 | tee $LFS/build-$(date +%Y%m%dT%H%M%S).log
