#!/bin/bash

hostn=`hostname`
pg_p=`ps -ef | grep 'wal writer process' | grep -v grep | wc -l`  #check Primary
pg_s=`ps -ef | grep 'recovering' | grep -v grep | wc -l`   #check Slave
echo "=== $hostn PostgreSQL DB Status ========================="
 if [ $pg_p == "1" ] ; then  #primary chk
    printf "\E[0;32;40m"   #green
    echo "$hostn Primary role on PostgreSQL DB is Running"
 else
    if [ $pg_s == "1" ] ; then  #chk pg_s
    printf "\E[0;33;40m"   #yellow
      echo "$hostn Slave role on PostgreSQL DB is Running"
    else
      printf "\E[0;31;40m"   #red
      echo "PostgreSQL DB is Not Running"
    fi
 fi
printf "\E[0m"   #white
echo "------------------------------------------------------------"
exit 0
