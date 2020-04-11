FROM php:7.4-fpm

RUN docker-php-ext-install pdo_mysql

ARG USER_ID
ARG GROUP_ID

COPY ./devbox.ini /usr/local/etc/php/conf.d/devbox.ini
COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup --gid $GROUP_ID phpfpm
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID phpfpm
USER phpfpm

CMD ["php-fpm"]
