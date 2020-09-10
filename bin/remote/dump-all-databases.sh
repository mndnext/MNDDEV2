#!/usr/bin/env bash

# (c) 2020-2021 MND Next GmbH
# make backup of database. Script to be run in docker environment.
# used by mnddev2-dw-dump

TARGET_DIR=$1
MYSQL_USER=$2
MYSQL_PASSWORD=$3

mkdir -p $TARGET_DIR

databases=`mysql --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|sys|mysql)"`

for db in $databases; do
  mysqldump --force --opt --quick --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db | gzip > "$TARGET_DIR/$db.gz"
done