# Folosim imaginea de bază Debian
FROM debian:latest
# Instalăm Apache, PHP, modulele PHP pentru Apache și MySQL, MariaDB și Supervisor
RUN apt-get update && \
apt-get install -y apache2 php libapache2-mod-php php-mysql mariadb-server supervisor && \
apt-get clean

# Creăm volume pentru stocarea datelor bazei de date și a logurilor
VOLUME /var/lib/mysql
VOLUME /var/log

# Adăugăm WordPress
ADD https://wordpress.org/latest.tar.gz /tmp/
RUN tar -xzf /tmp/latest.tar.gz -C /var/www/html/ --strip-components=1 \
    && rm /tmp/latest.tar.gz \
    && chown -R www-data:www-data /var/www/html

# Copiem fișierele de configurare
COPY files/apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY files/apache2/apache2.conf /etc/apache2/apache2.conf
COPY files/php/php.ini /etc/php/8.4/apache2/php.ini
COPY files/mariadb/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY files/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY files/wp-config.php /var/www/html/wordpress/wp-config.php

# Creăm directorul pentru socketul MariaDB
RUN mkdir /var/run/mysqld && chown mysql:mysql /var/run/mysqld

# Deschidem portul 80 pentru serverul web
EXPOSE 80

# Pornim Supervisor pentru gestionarea serviciilor Apache și MariaDB
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]