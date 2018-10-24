######################################################################
#
# 透過 docker-compose exec 進入容器內執行 php artisan
#
######################################################################

#!/bin/bash
DOCKER_COMPOSE="/usr/local/bin/docker-compose"
PHP_FPM_SERVICE_NAME="php-fpm"

# 取得目前登入之 user id 與 group id
uid=$(id -u)
gid=$(id -g)

$DOCKER_COMPOSE run -u $uid:$gid $PHP_FPM_SERVICE_NAME php artisan $@
