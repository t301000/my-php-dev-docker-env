######################################################################
#
# 透過 docker-compose exec 進入 php-fpm 容器
#
######################################################################

#!/bin/bash
DOCKER_COMPOSE="/usr/local/bin/docker-compose"
SERVICE_NAME="php-fpm"

# 取得目前登入之 user id 與 group id
uid=$(id -u)
gid=$(id -g)

echo ">>>> 進入 ${SERVICE_NAME} 容器...."
echo ""

$DOCKER_COMPOSE exec -u $uid:$gid $SERVICE_NAME bash
