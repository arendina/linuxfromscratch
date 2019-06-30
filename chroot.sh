#!/bin/bash
time ( \
    sudo $LFS/scripts/6.02.Preparing-Virtual-Kernel-File-Systems.sh && \
    sudo $LFS/scripts/6.04.Entering-the-Chroot-Environment.sh \
) 2>&1 | tee /build-$(date +%Y%m%dT%H%M%S).log
exit
