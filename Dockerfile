FROM php:5.6-apache
# RUN apt install --upgrade -y zip
RUN apt update && apt install wget zip --upgrade -y && \
  cd /tmp && \
 wget https://github.com/opencats/OpenCATS/archive/0.9.3-3.zip && \
  unzip ./0.9.3-3.zip -d /tmp && \
  mv /tmp/OpenCATS-*/* /var/www/html