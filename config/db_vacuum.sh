
 pg_p=`ps -ef | grep 'wal writer process' | grep -v grep | wc -l`
 now_t=`date +%Y%m%d-%H:%M`
 hostn=`hostname`
 pg_baklog=/log/db/pg_backup.log
  if [ $pg_p == "1" ] ; then  #primary chk
    echo "$now_t on $hostn PostgreSQL DB Vacuuming !!!" >> $pg_baklog
    /usr/pgsql-9.5/bin/vacuumdb -a -z -f >> $pg_baklog
  else
    echo "Is not primary DB !!!"
  fi
exit

