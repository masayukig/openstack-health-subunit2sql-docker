#!/bin/sh

# migrate database
/venv/bin/subunit2sql-db-manage --config-file /app/etc/subunit2sql.conf upgrade head

# load data
RUN_META=${SUBUNIT2SQL_RUN_META:-project:openstack/tempest, build_name:default-build}
ARTIFACTS=${SUBUNIT2SQL_ARTIFACTS:-http://example.com/}
mkdir -p /data/bak/v1
mkdir -p /data/bak/v2
for f in /data/*
do
    if [ -f ${f} ]; then
        cat ${f} | /venv/bin/subunit-1to2 > ${f}.v2
        mv ${f} /data/bak/v1/
        /venv/bin/subunit2sql --config-file /app/etc/subunit2sql.conf --run_meta "${RUN_META}" --artifacts "${ARTIFACTS}" ${f}.v2
        mv ${f}.v2 /data/bak/v2/
    fi
done
