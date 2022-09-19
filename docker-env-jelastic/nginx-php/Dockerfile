ARG JELASTIC_NGINX_IMAGE_VERSION
ARG BUILD_ARGUMENT_ENV

FROM jelastic/nginxphp:$JELASTIC_NGINX_IMAGE_VERSION AS base

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

ARG user=nginx
ARG BUILD_ENV=local
ARG BUILD_DEBUG=true
ENV APP_HOME /var/www/app
ENV ENV=$BUILD_ARGUMENT_ENV
ENV DEBUG_ENABLED=$BUILD_DEBUG

RUN yum install -y sed && \
    sed -i "s|;extension=intl.so|extension=intl.so|g" /etc/php.ini && \
    sed -i "s|;extension=pdo_mysql.so|extension=pdo_mysql.so|g" /etc/php.ini && \
    sed -i "s|;extension=apcu.so|extension=apcu.so|g" /etc/php.ini && \
    sed -i "s|; zend_extension=/usr/lib64/php/modules/opcache.so|zend_extension=/usr/lib64/php/modules/opcache.so|g" /etc/php.ini && \
    sed -i "s|;extension=memcached.so|extension=memcached.so|g" /etc/php.ini && \
    sed -i "s|;zend_extension=/usr/lib64/php/modules/xdebug.so|zend_extension=/usr/lib64/php/modules/xdebug.so|g" /etc/php.ini

FROM base as build-backend

WORKDIR $APP_HOME

COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
