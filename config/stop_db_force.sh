echo "-------------------------------------------------"
echo " Force Stop PostgresSql service"
echo "-------------------------------------------------"

/usr/pgsql-9.5/bin/pg_ctl -D /db/data -l /log/db/logfile stop -m fast


echo "-------------------------------------------------"

