#!/bin/sh
/usr/local/sbin/php-fpm &
nginx -g 'daemon off;'