FROM php:8.1.8-apache-buster

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        libxml2-dev \
        zlib1g-dev \
        libicu-dev \
        g++ \
        zip \
        curl \
        cron \
        supervisor \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure zip \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure pcntl \
    && docker-php-ext-install -j$(nproc) pcntl \
    && docker-php-ext-configure pdo_mysql \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && pecl install redis \
      && docker-php-ext-enable redis

COPY --from=composer:2.0.8 /usr/bin/composer /usr/bin/composer

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && sed -E -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 10M/' /usr/local/etc/php/php.ini-development \
    && cp /usr/local/etc/php/php.ini-production php.ini \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \; \
    && sed -i '3s/^/cron/' /usr/local/bin/apache2-foreground \
    && chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite

RUN (crontab -l 2>/dev/null; echo "* * * * * php /var/www/html/artisan schedule:run") | crontab -
