#!/bin/bash

# All chapter 5
time ($LFS/scripts/5.04.Binutils-Pass-1.sh && \
    $LFS/scripts/5.05.GCC-Pass-1.sh && \
    $LFS/scripts/5.06.Linux-API-Headers.sh && \
    $LFS/scripts/5.07.Glibc.sh && \
    $LFS/scripts/5.08.Libstdc++.sh && \
    $LFS/scripts/5.09.Binutils-Pass-2.sh && \
    $LFS/scripts/5.10.GCC-Pass-2.sh && \
    $LFS/scripts/5.11.Tcl.sh && \
    $LFS/scripts/5.12.Expect.sh && \
    $LFS/scripts/5.13.DejaGNU.sh && \
    $LFS/scripts/5.14.M4.sh && \
    $LFS/scripts/5.15.Ncurses.sh && \
    $LFS/scripts/5.16.Bash.sh && \
    $LFS/scripts/5.17.Bison.sh && \
    $LFS/scripts/5.18.Bzip2.sh && \
    $LFS/scripts/5.19.Coreutils.sh && \
    $LFS/scripts/5.20.Diffutils.sh && \
    $LFS/scripts/5.21.File.sh && \
    $LFS/scripts/5.22.Findutils.sh && \
    $LFS/scripts/5.23.Gawk.sh && \
    $LFS/scripts/5.24.Gettext.sh && \
    $LFS/scripts/5.25.Grep.sh && \
    $LFS/scripts/5.26.Gzip.sh && \
    $LFS/scripts/5.27.Make.sh && \
    $LFS/scripts/5.28.Patch.sh && \
    $LFS/scripts/5.29.Perl.sh && \
    $LFS/scripts/5.30.Python.sh && \
    $LFS/scripts/5.31.Sed.sh && \
    $LFS/scripts/5.32.Tar.sh && \
    $LFS/scripts/5.33.Texinfo.sh && \
    $LFS/scripts/5.34.Xz.sh \
) 2>&1 | tee $LFS/build-$(date +%Y%m%dT%H%M%S).log
