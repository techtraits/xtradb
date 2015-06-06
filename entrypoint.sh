#!/bin/sh

if [ -z "$MYSQL_ROOT_PASSWORD" -a -z "$MYSQL_ALLOW_EMPTY_PASSWORD" ]; then
	echo >&2 'error: database is uninitialized and MYSQL_ROOT_PASSWORD not set'
	echo >&2 '  Did you forget to add -e MYSQL_ROOT_PASSWORD=... ?'
	exit 1
fi

mysql_install_db --datadir=/data --user=mysql

tempSqlFile='/tmp/mysql-setup.sql'
cat > "$tempSqlFile" <<-EOSQL
	DELETE FROM mysql.user ;
	CREATE USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;
	GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;
	DROP DATABASE IF EXISTS test ;
EOSQL
if [ "$MYSQL_DATABASE" ]; then
	echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` ;" >> "$tempSqlFile"
fi

if [ "$MYSQL_USER" -a "$MYSQL_PASSWORD" ]; then
	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> "$tempSqlFile"
	
	if [ "$MYSQL_DATABASE" ]; then
		echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%' ;" >> "$tempSqlFile"
	fi
fi

echo 'FLUSH PRIVILEGES ;' >> "$tempSqlFile"

set -- "mysqld" --init-file="$tempSqlFile"
bash