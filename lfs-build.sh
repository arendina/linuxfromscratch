#!/tools/bin/bash
time ( \
    /scripts/6.05.Creating-Directories.sh && \
    /scripts/6.06.Creating-Essential-Files-and-Symlinks.sh && \
    /scripts/6.07.Linux-API-Headers.sh && \
    /scripts/6.08.Man-pages.sh && \
    /scripts//6.09.Glibc.sh \
) 2>&1 | tee /build-$(date +%Y%m%dT%H%M%S).log
exit
