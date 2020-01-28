#!/usr/bin/env bash

ED="/hdd/jonas/Games/Steam/steamapps/compatdata/359320/pfx/drive_c/users/steamuser/Saved Games/Frontier Developments/Elite Dangerous"

if [ -e Journal.log ]; then
    rm Journal.log
fi

if [ ! -e temp ]; then
    mkdir temp
fi

find "${ED}" -newermt $(date +%Y-%m-%d -d '25 days ago') -type f -name "*.01.log" -exec cp '{}' temp \;

for i in $(ls temp/ | sort); do
    cat temp/$i >> Journal.log
done

rm -r temp

echo Visit https://inara.cz/cmdr to upload your journal
