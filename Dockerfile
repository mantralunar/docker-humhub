FROM php:7.3-apache
RUN apt-get update && apt-get install -y \
  build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev libjpeg62-turbo-dev zlib1g-dev libicu-dev g++ libzip-dev
  
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install gd

RUN docker-php-ext-configure intl && docker-php-ext-install intl

RUN docker-php-ext-install pdo_mysql zip

RUN apt-get autoremove
