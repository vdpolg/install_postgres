
echo "Switch Slave Mode to Primary Mode......"
touch /db/data/stop_replication_trigger
echo "Switch Slave Mode to Primary Mode......Done"
echo "Restart PostgreSQL Server......"
./stop_db.sh
./stop_db_force.sh
./start_db.sh
echo "Restart PostgreSQL Server......Done"
