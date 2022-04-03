FROM php:8.1-apache-buster
MAINTAINER Latheesan Kanesamoorthy

# Update base system
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --no-install-recommends -y wget curl nano sudo libpng-dev libzip-dev zip unzip

# Install & enable required php libraries
RUN pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis \
    && docker-php-ext-install -j$(nproc) pcntl zip mysqli pdo_mysql gd bcmath

# Configure php & apache
RUN cp /usr/local/etc/php/php.ini-production php.ini && \
    rm -rf /etc/apache2/sites-available/* && \
    rm -rf /etc/apache2/sites-enabled/* && \
    echo 'ServerName mercury-invoice.app' >> /etc/apache2/apache2.conf
COPY /docker/php.ini /usr/local/etc/php/conf.d/custom.ini
COPY /docker/mercury-invoice.app.conf /etc/apache2/sites-available/mercury-invoice.app.conf
RUN a2enmod rewrite && \
    a2ensite mercury-invoice.app

# Clean-up
RUN sudo apt-get -y purge && sudo apt-get -y clean && \
    sudo apt-get -y autoremove && sudo rm -rf /var/lib/apt/lists/* && \
    sudo rm -rf /usr/bin/apt*

# Create mercury-invoice user
RUN adduser --disabled-password --gecos '' mercury-invoice && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    adduser mercury-invoice sudo && \
    chown -R mercury-invoice:mercury-invoice /home/mercury-invoice/.*

# Install composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && rm -f composer-setup.php \
    && mv composer.phar /usr/local/bin/composer

# Set mercury-invoice user
USER mercury-invoice
WORKDIR /home/mercury-invoice/application

# Expose apache port
EXPOSE 80
