###################################
#
# run composer in php-fpm container
#
###################################
#!/bin/bash
DOCKER_COMPOSE="/usr/local/bin/docker-compose"
PHP_FPM_SERVICE_NAME="php-fpm"

# 取得目前登入之 user id 與 group id
uid=$(id -u)
gid=$(id -g)

composer_dir=$HOME/.composer

# 如果家目錄下沒有 .composer 目錄則建立，並變更擁有者與群組
if [ ! -d $composer_dir ]; then
    mkdir $composer_dir
    chown $uid.$gid $composer_dir
fi

if [ -d $composer_dir ]; then
    $DOCKER_COMPOSE exec -u $uid:$gid $PHP_FPM_SERVICE_NAME composer $@
fi
