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
    sed -i "s|apc.preload_path =|;apc.preload_path =|g" /etc/php.ini && \
    sed -i "s|; zend_extension=/usr/lib64/php/modules/opcache.so|zend_extension=/usr/lib64/php/modules/opcache.so|g" /etc/php.ini && \
    sed -i "s|;extension=memcached.so|extension=memcached.so|g" /etc/php.ini && \
    sed -i "s|;zend_extension=/usr/lib64/php/modules/xdebug.so|zend_extension=/usr/lib64/php/modules/xdebug.so|g" /etc/php.ini && \
    sed -i "s|xdebug.trace_enable_trigger = 0|;xdebug.trace_enable_trigger = 0|g" /etc/php.ini && \
    sed -i "s|xdebug.trace_output_dir = /tmp|;xdebug.trace_output_dir = /tmp|g" /etc/php.ini && \
    sed -i "s|xdebug.show_mem_delta = 1|;xdebug.show_mem_delta = 1|g" /etc/php.ini && \
    sed -i "s|xdebug.remote_port = 9000|;xdebug.remote_port = 9000|g" /etc/php.ini && \
    sed -i "s|xdebug.remote_mode = req ; jit|;xdebug.remote_mode = req ; jit|g" /etc/php.ini && \
    sed -i "s|xdebug.remote_host = localhost|;xdebug.remote_host = localhost|g" /etc/php.ini && \
    sed -i "s|xdebug.remote_enable = 0|;xdebug.remote_enable = 0|g" /etc/php.ini && \
    sed -i "s|xdebug.remote_connect_back = 0|;xdebug.remote_connect_back = 0|g" /etc/php.ini && \
    sed -i "s|xdebug.remote_autostart = 0|;xdebug.remote_autostart = 0|g" /etc/php.ini && \
    sed -i "s|xdebug.profiler_output_dir = /tmp|;xdebug.profiler_output_dir = /tmp|g" /etc/php.ini && \
    sed -i "s|xdebug.profiler_enable = 0|;xdebug.profiler_enable = 0|g" /etc/php.ini && \
    sed -i "s|xdebug.profiler_enable_trigger = 0|;xdebug.profiler_enable_trigger = 0|g" /etc/php.ini && \
    sed -i "s|xdebug.overload_var_dump = 1|;xdebug.overload_var_dump = 1|g" /etc/php.ini && \
    sed -i "s|xdebug.coverage_enable = 1|;xdebug.coverage_enable = 1|g" /etc/php.ini && \
    sed -i "s|xdebug.collect_vars = 0|;xdebug.collect_vars = 0|g" /etc/php.ini && \
    sed -i "s|xdebug.collect_params = 0 ; 0-5|;xdebug.collect_params = 0 ; 0-5|g" /etc/php.ini && \
    sed -i "s|xdebug.collect_includes = 0|;xdebug.collect_includes = 0|g" /etc/php.ini && \
    sed -i "s|xdebug.auto_trace = 0|;xdebug.auto_trace = 0|g" /etc/php.ini

FROM base as build-backend

WORKDIR $APP_HOME

COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
