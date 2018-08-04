######################################################################
#
# 透過 docker-compose exec 進入容器內執行 php artisan
#
######################################################################

#!/bin/bash
DOCKER_COMPOSE="/usr/local/bin/docker-compose"
PHP_FPM_SERVICE_NAME="php-fpm"


$DOCKER_COMPOSE exec -u `id -u`:`id -g` $PHP_FPM_SERVICE_NAME php artisan $@
