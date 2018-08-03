###################################
#
# 新建 laravel project
#
# 用法：
#    laravel-new.sh
###################################
#!/bin/bash

# 新專案放置之資料夾
name="site"

# 取得目前登入之 user id 與 group id
uid=$(id -u)
gid=$(id -g)

composer_dir=$HOME/.composer

echo "**** 新建 laravel project ****"
echo "**** Ctrl + c 中斷執行    ****"


read -p "Laravel 版本號（例如：5.5.0），空白則為最新版： " version

if [ "${version}" != "" ]; then
    version=":${version}"
fi

# name=$1
# while [ "${name}" == "" ]
# do
#     read -p "專案名稱： " name
# done

# 如果家目錄下沒有 .composer 目錄則建立，並變更擁有者與群組
if [ ! -d $composer_dir ]; then
    mkdir $composer_dir
    chown $uid.$gid $composer_dir
fi

if [ -d $composer_dir ]; then
    
    cd ..

    if [ -d $name ]; then
        DATE=`date '+%Y%m%d%H%M%S'`
        mv $name "${name}.bak-${DATE}" 
    fi

    echo ""
    echo "在 ${PWD}/${name} 中建立專案，請稍候...."
    echo ""

    docker container run --rm -it \
        -v $PWD:/app \
        -v $composer_dir:/tmp \
        -u $uid:$gid \
        composer create-project --prefer-dist laravel/laravel${version} ${name}

fi
