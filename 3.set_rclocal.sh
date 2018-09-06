#!/bin/bash
#名稱		版本	日期		作者	備註
#set rc.local	v1.1	20180906	arthur	設定rc.local啟動shell
source $PWD/config/011-initializeANSI #載入color
WRKDIR=$PWD #工作目錄
printf "請輸入開機啟動的DB名稱： " ;read DBNAME
echo "# Start $DBNAME Database Service" >> /etc/rc.local
echo "su - postgres -c "/home/postgres/start_db.sh"" >> /etc/rc.local
echo "rc.locat ↓↓"
cat /etc/rc.local

