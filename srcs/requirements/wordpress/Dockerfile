FROM debian:bullseye

RUN apt update -y && apt upgrade -y

#install wget, mandatory for install wordpress
RUN apt-get -y install wget

#install PHP
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

#install wordpress with wget
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
RUN chmod -R -755 /var/www/html

COPY /conf/auto_conf.sh /usr/bin/auto_conf.sh
COPY ./conf/php-fpm.conf /etc/php-fpm.conf
COPY ./conf/wp-config-sample.php /tmp/tmp.php

RUN chmod +x /usr/bin/auto_conf.sh 
RUN mkdir -p /var/run/
RUN mkdir -p /run/php

# RUN groupadd www-data
# RUN useradd -G www-data www

CMD ["./usr/bin/auto_conf.sh", "php-fpm7.4", "-F"]