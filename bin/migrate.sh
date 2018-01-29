#!/bin/sh

# migrate database
/venv/bin/subunit2sql-db-manage --config-file /app/etc/subunit2sql.conf upgrade head

# load data
for f in /data/* :
do
    mkdir -p /data/org
    if [ -f ${f} ]; then
        cat ${f} | /venv/bin/subunit-1to2 > ${f}.v2
        mv ${f} /data/org/
    fi
done
/venv/bin/subunit2sql --config-file /app/etc/subunit2sql.conf /data/*
