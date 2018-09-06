#!/bin/sh
HOST=$1

CURRDATE=`date +"%Y%m%d%H%M%S"`

echo "ReSync Data Start......"

#Stop PostgreSQL Force
echo "Force Stop PostgreSQL......"
/usr/pgsql-9.5/bin/pg_ctl -D /db/data -l logfile stop -m fast

#Backup Data File
echo "Backup Current Data File"
cd /db
#tar -zcvf data$CURRDATE.tar.gz data
mkdir -p /db/backup/$CURRDATE
mv data /db/backup/$CURRDATE

#Delete Current File
echo "Delete Current Data File"
rm -rf data

echo "ReSync Data From Primary Server......"
/usr/pgsql-9.5/bin/pg_basebackup -P -D data --host=$HOST --port=5432

#Copy Slave Config
echo "Copy Slave Config......"
cp bak_conf/slave/recovery.conf data

#replace recovery.conf
echo "Replace recovery.conf"
REPLACESTRING="s/ReplaecHostIP/$HOST/g"
echo $REPLACESTRING
sed -ig $REPLACESTRING /db/data/recovery.conf

#Start PostgreSQL Force
echo "Start PostgreSQL......"
cd
./start_db.sh
