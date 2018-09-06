#!/bin/bash
#名稱	版本	日期		作者	備註
#SetEnv	v1.1	20180906	arthur	設定db環境
source $PWD/config/011-initializeANSI #載入color
WRKDIR=$PWD #工作目錄
if [ $LOGNAME != "postgres" ]
then
        echo "Please su - \"postgres\" to execute."
        exit 0
fi

cp $WRKDIR/config/*.sh /home/postgres/
chmod 700 /home/postgres/*.sh
mkdir /db/data
mkdir /db/backup
mkdir /log/db
/usr/pgsql-9.5/bin/initdb -E UNICODE -D /db/data
PGC=/db/data/postgresql.conf
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" $PGC
sed -i "s/#port = 5432/port = 5432/g" $PGC
sed -i "s/max_connections = 100/max_connections = 300/g" $PGC
sed -i "s/#tcp_keepalives_idle = 0/tcp_keepalives_idle = 600/g" $PGC

echo ''
/home/postgres/start_db.sh # 啟動DB
echo -e '  ==succeeded! 請su - root 設定開機啟動== \n'
exit 0
