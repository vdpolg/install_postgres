#!/bin/bash
#名稱		版本	日期		作者	備註
#install PSQL	v1.1	20180906	arthur	first commit
source $PWD/config/011-initializeANSI #載入color
WRKDIR=$PWD #工作目錄
rpm -ivh *.rpm
mkdir -p /db
chown -R postgres:postgres /db
usermod -d /home/postgres -m postgres
PBF=~postgres/.bash_profile 
psql_bashfile(){ #設定postgres的 bash_file
sed -i '/PGDATA/d' $PBF #刪含有PGDATA的行
cat >> $PBF << EOF
PGDATA=/db/data
export PGDATA
PATH=\$PATH:/usr/pgsql-9.5/bin/
export PATH
EOF
}
psql_bashfile
echo ''
echo -e '==請su - postgres 繼續安裝== \n'
exit 0
