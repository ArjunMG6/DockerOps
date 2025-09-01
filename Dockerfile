FROM ubuntu:latest

RUN apt update && apt upgrade -y

RUN apt install php php-mysql -y

RUN apt install apache2 -y

RUN apt install wget unzip zip -y

WORKDIR /etc/apache2/sites-available/

RUN mv 000-default.conf 000-default_def

COPY 000-default.conf .

WORKDIR /var/www/html/

RUN wget https://wordpress.org/latest.zip && unzip latest.zip

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

