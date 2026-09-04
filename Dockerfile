FROM php:7.4-apache

RUN apt-get update && apt-get install -y libxml2-dev libpng-dev libjpeg-dev libfreetype6-dev \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-install -j$(nproc) soap \
	&& docker-php-ext-install -j$(nproc) pdo_mysql

RUN apt-get autoremove --purge -y && apt-get clean -y
