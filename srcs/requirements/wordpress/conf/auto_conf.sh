#!/bin/sh


WPPATH="/var/www/html"
CONFIGFILE="$WPPATH/wp-config.php"

if [ -f "/var/www/html/wp-config.php" ]; then
	printf "wordpress has already been configured\n"
else
	sleep 10

	wp core download	--allow-root \
						--path=$WPPATH || (rm -rf $WPPATH/* && exit 1)

	# wp config create	--allow-root \
						# --dbname=$SQL_DB \
						# --dbuser=$SQL_USER \
						# --dbpass=$SQL_PWORD \
						# --dbhost=mariadb:3306 \
						# --path=$WPPATH || (rm -rf $WPPATH/* && exit 1)

	cp /tmp/tmp.php $CONFIGFILE
	sed 's/\[$SQL_DB\]/'$SQL_DB'/g' $CONFIGFILE >/tmp/tmp.php
	cp /tmp/tmp.php $CONFIGFILE
	sed 's/\[$SQL_USER\]/'$SQL_USER'/g' $CONFIGFILE >/tmp/tmp.php 
	cp /tmp/tmp.php $CONFIGFILE
	sed 's/\[$SQL_PWORD\]/'$SQL_PWORD'/g' $CONFIGFILE >/tmp/tmp.php
	sed 's/\[$SQL_HOST\]/mariadb:3306/g' /tmp/tmp.php >$CONFIGFILE 

	# cat $CONFIGFILE

	wp core install		--allow-root \
						--url=$WP_URL \
						--title=$WP_TITLE \
						--admin_user=$WP_ADM \
						--admin_password=$WP_ADM_PWORD \
						--admin_email=membalarace@mescouillessurlable.com \
						--path=$WPPATH || (rm -rf $WPPATH/* && exit 1)
						
	wp user create		$WP_USR $WP_USR_ML --allow-root \
						--user_pass=$WP_USR_PWORD \
						--path=$WPPATH || (rm -rf $WPPATH/* && exit 1)

	ls $WPPATH
fi

exec "php-fpm7.4" "-F" "--fpm-config" "/etc/php-fpm.conf"