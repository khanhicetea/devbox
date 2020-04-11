FROM php:7.4-fpm

RUN apt-get update && apt-get install -y zlib1g-dev libzip-dev libpng-dev libjpeg-dev libfreetype6-dev libpq-dev && \
    rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install zip gd pdo_mysql pdo_pgsql
RUN pecl install redis && \
    docker-php-ext-enable redis

ARG USER_ID
ARG GROUP_ID

COPY ./devbox.ini /usr/local/etc/php/conf.d/devbox.ini
COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup --gid $GROUP_ID phpfpm
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID phpfpm
USER phpfpm

CMD ["php-fpm"]
