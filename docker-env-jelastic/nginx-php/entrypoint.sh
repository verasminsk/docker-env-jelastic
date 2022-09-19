#!/usr/bin/env bash

service php-fpm start
nginx -g "daemon off;"
