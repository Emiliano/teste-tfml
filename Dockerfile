FROM nginx:latest

COPY site.conf /etc/nginx/conf.d/default.conf

RUN  apt-get install php-fpm php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip

RUN cd /tmp \
    && curl -O https://wordpress.org/latest.tar.gz \
    && tar xzvf latest.tar.gz \
    && cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php \
    && mkdir /tmp/wordpress/wp-content/upgrade \
    && mv -r /tmp/wordpress/. /var/www/wordpress

COPY wp-config.php /var/www/wordpress/wp-config.php

EXPOSE 80

