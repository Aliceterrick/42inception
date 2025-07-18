#Precise the OS for built the image with
FROM debian:bullseye

#Install nginx and some utils
RUN apt update ; \
	apt upgrade -y; \
	apt install nginx -y ;

#Install ssl/tsl and generate a certificate
RUN	mkdir -p /etc/nginx/ssl ; \
	apt install openssl -y
RUN	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hedubois.42.fr/UID=hedubois"

#Set the correct rights
RUN	chmod 755 /var/www/html ; \
	chown -R www-data:www-data /var/www/html


#Copy the new config in the apropriate file
COPY conf/nginx.conf /etc/nginx/nginx.conf

#output nginx error to stderr
RUN rm -f /var/log/nginx/error.log
RUN ln -s /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]