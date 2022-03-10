FROM php:fpm-alpine

ARG HTTP_PROXY="http://192.168.240.1:7890"
ARG HTTPS_PROXY="http://192.168.240.1:7890"

RUN set -e &&\
    curl -sSLf \
        -o /usr/local/bin/install-php-extensions \
        https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd exif opcache && \
    apk add --no-cache yasm ffmpeg zip graphicsmagick

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]