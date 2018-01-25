#!/bin/sh

# migrate database
/venv/bin/subunit2sql-db-manage --config-file ../etc/subunit2sql.conf upgrade head

# load data
# /venv/bin/subunit2sql --config-file ../etc/subunit2sql.conf <subunit_files>
