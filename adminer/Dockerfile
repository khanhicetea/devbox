FROM php:7.4-fpm-alpine

RUN docker-php-ext-install mysqli

COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./devbox.ini /usr/local/etc/php/conf.d/devbox.ini
COPY ./adminer.php /www/index.php
