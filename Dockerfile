FROM monkeycompany/php-apache-certbot
RUN apt install --upgrade -y zip
RUN cd /tmp && \
  wget https://github.com/opencats/OpenCATS/archive/0.9.3-3.zip && \
  unzip ./0.9.3-3.zip -d /tmp && \
  mv /tmp/OpenCATS-*/* /var/www/html