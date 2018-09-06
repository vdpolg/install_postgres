
 pg_p=`ps -ef | grep 'wal writer process' | grep -v grep | wc -l`
 now_t=`date +%Y%m%d-%H:%M`
 hostn=`hostname`
 pg_baklog=/log/db/pg_backup.log
  if [ $pg_p == "1" ] ; then  #primary chk
    echo "$now_t on $hostn Postgres Primary Backup Start" >> $pg_baklog
    /usr/pgsql-9.5/bin/pg_dumpall | gzip -c > /backup.eps/`date +%Y%m%d-%H%M`db.bak.gz
  else
    echo "Is not primary DB !!!"
  fi
exit

