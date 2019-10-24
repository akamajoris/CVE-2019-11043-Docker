FROM  php:7.3.9-fpm
RUN /bin/bash

FROM nginx:1.16.1
COPY ./starter.sh /starter.sh
COPY index.php /var/www/html/
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /usr/local/etc/ /usr/local/etc/
COPY --from=0 /usr/local/sbin/php-fpm /usr/local/sbin/php-fpm
RUN apt update && apt install -y libargon2-0 libedit-dev libcurl4-openssl-dev
CMD chmod +x /starter.sh && /starter.sh