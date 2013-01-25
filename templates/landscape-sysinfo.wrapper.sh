#!/bin/sh
cores=$(grep -c ^processor /proc/cpuinfo 2>/dev/null)
[ "$cores" -eq "0" ] && cores=1
threshold="${cores:-1}.0"
if [ $(echo "`cut -f1 -d ' ' /proc/loadavg` < $threshold" | bc) -eq 1 ]; then
    echo
    echo -n "  System information as of "
    /bin/date
    echo
    /usr/bin/landscape-sysinfo --exclude-sysinfo-plugins=LoggedInUsers
else
    echo
    echo " System information disabled due to load higher than $threshold"
fi