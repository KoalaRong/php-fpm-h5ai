#! /bin/sh

set -e
chown -R www-data:www-data /var/www/h5ai.koalarong.com

exec php-fpm