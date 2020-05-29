FROM php:7.4

RUN docker-php-ext-install opcache && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"  && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');"
ADD opcache.ini /usr/local/etc/php/conf.d/docker-php-ext-opcache-conf.ini

WORKDIR /www/vhosts/superjob
ADD . /www/vhosts/superjob
RUN php -d allow_url_fopen=1 /composer.phar install

CMD ["php", "-S", "0.0.0.0:80", "-t", ".", "index.php"]
