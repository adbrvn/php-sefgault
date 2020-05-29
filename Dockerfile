FROM docker-registry.sj-dev.local:4000/sj-php:7.4

WORKDIR /www/vhosts/superjob
ADD . /www/vhosts/superjob
RUN php -d allow_url_fopen=1 -f $(which composer) -- install

CMD ["php", "-S", "0.0.0.0:80", "-t", ".", "index.php"]
