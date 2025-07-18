#!/bin/bash

set -m

chmod 777 /var/lib/mysql

if [ ! -d '/var/lib/mysql/wordpress' ]; then
	mariadb-install-db 	--user=root \
				--basedir=/usr \
				--datadir=/var/lib/mysql


    service mariadb start;
    sleep 5

    echo "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`;" >/tmp/tmp
    echo "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PWORD}';" >>/tmp/tmp
    echo "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PWORD}';"  >>/tmp/tmp
    # echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWORD}';" >>/tmp/tmp
    echo "FLUSH PRIVILEGES;" >>/tmp/tmp
    mysql -u root </tmp/tmp

    mysqladmin -u root -p$SQL_ROOT_PWORD shutdown
fi

exec mysqld_safe