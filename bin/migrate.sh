#!/bin/sh

# migrate database
/venv/bin/subunit2sql-db-manage --config-file /app/etc/subunit2sql.conf upgrade head

# load data
for f in /data/* :
do
    if [ -f ${f} ]; then
        # FIXME: This is very nasty code...
        cat ${f} | /venv/bin/subunit-1to2 > ${f}.v2
        rm ${f}
    fi
done
/venv/bin/subunit2sql --config-file /app/etc/subunit2sql.conf /data/*
