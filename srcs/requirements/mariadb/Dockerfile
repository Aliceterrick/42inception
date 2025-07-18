FROM debian:bullseye

#Install nginx and some utils
RUN apt update && apt upgrade -y && \
	apt-get install mariadb-server tcpdump -y

#Copy the configuration file
COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY /tools/script.sh .

RUN chmod 755 ./script.sh

EXPOSE 3306

CMD ["sh", "script.sh"]