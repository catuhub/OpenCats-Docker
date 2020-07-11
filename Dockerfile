# Opencats is only compatible with php 5.6 at this time, yes that is dumb
FROM php:5.6-apache
# Setup Php extensions required by Opencats
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd soap mysql xml curl mbstring zip ldap
# Download and move opencats files to the html folder
RUN apt update && apt install wget zip --upgrade -y && \
  cd /tmp && \
 wget https://github.com/opencats/OpenCATS/archive/0.9.3-3.zip && \
  unzip ./0.9.3-3.zip -d /tmp && \
  mv /tmp/OpenCATS-*/* /var/www/html && \
  chown -R www-data:www-data /var/www/html/ && chmod 770 /var/www/html/attachments && \
  chmod 770 /var/www/html/upload 
  # && chmod 770 /var/www/html/config.php
# Install indexing deps for opencats
RUN apt update && apt install antiword poppler-utils html2text unrtf -y