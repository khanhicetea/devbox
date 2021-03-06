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

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

RUN addgroup --gid $GROUP_ID phpfpm
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID phpfpm
USER phpfpm

RUN composer global require -vvv --prefer-dist hirak/prestissimo

CMD ["php-fpm"]
