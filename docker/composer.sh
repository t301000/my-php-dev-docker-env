###################################
#
# docker composer
#
###################################
#!/bin/bash

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
    cd ../site
    docker container run --rm -it \
        -v $PWD:/app \
        -v $composer_dir:/tmp \
        -u $uid:$gid \
        composer $@
fi
