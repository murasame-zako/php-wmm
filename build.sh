#!/bin/bash
export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS"
apt-get update
apt-get upgrade -y
apt-get install -y --no-install-recommends libfreetype6-dev libjpeg62-turbo-dev libpng-dev libwebp-dev libmagickwand-dev libzip-dev libbz2-dev libicu-dev libgmp-dev libxslt1-dev libmemcached-dev libpq-dev libyaml-dev git
rm -r /var/lib/apt/lists/*
docker-php-ext-configure gd --with-webp --with-jpeg --with-freetype
docker-php-ext-configure mysqli --with-mysql-sock=/var/run/mysqld/mysqld.sock
docker-php-ext-configure exif --enable-exif

pecl install imagick-3.8.1
docker-php-ext-enable imagick
pecl install memcached-3.4.0
docker-php-ext-enable memcached
pecl install yaml-2.3.0
docker-php-ext-enable yaml

docker-php-ext-install -j$(nproc) gd zip bz2 intl gmp pdo_mysql mysqli pdo_pgsql pgsql exif xsl opcache

git clone https://github.com/jvoisin/snuffleupagus /usr/src/snuffleupagus
cd /usr/src/snuffleupagus/src
phpize
./configure --enable-snuffleupagus
make -j$(nproc)
make install
cp -r /usr/src/snuffleupagus/config/ /etc/sp_rules/
rm -r /usr/src/snuffleupagus/
docker-php-ext-enable snuffleupagus
cp /build/sp_default.ini /usr/local/etc/php/conf.d/

rm -rf /build