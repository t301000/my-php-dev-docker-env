#!/bin/bash

lsb_dist=""
# Every system that we officially support has /etc/os-release
if [ -r /etc/os-release ]; then
    lsb_dist="$(. /etc/os-release && echo "$ID")"
fi

# 檢查需要的程式是否存在
packages=""
if [[ ! -f /usr/bin/vim ]]; then
    packages=" vim"
fi
if [[ ! -f /usr/bin/curl ]]; then
    packages=$packages" curl"
fi
if [[ ! -f /usr/bin/git ]]; then
    packages=$packages" git"
fi
if [[ ! -f /usr/bin/unzip ]]; then
    packages=$packages" unzip"
fi
if [[ ! -f /usr/bin/wget ]]; then
    packages=$packages" wget"
fi
# 安裝缺少的程式
if [[ $packages != "" ]]; then
    if [ "$lsb_dist" == "centos" ]; then
        sudo yum install -y $packages
    else
        sudo apt install -y $packages
    fi
fi

exit 0
if [ ! -d ../db_data ] ; then
    mkdir -p ../db_data/mysql
    chmod 777 -Rf ../db_data
fi

if [ ! -d ../logs ] ; then
    mkdir -p ../logs/caddy
    chmod 777 -Rf ../logs
fi

read -p "Build Image mode: (Default: N)[y/N]" build_mode
if [ "${build_mode}" == "y" ] || [ "${build_mode}" == "Y" ]; then
    echo -e ">>> cp \e[92menv-example\e[0m .env"
    cp env-example .env
else
    echo -e ">>> cp \e[92menv-prod-example\e[0m .env"
    cp env-prod-example .env
fi

./setup-env.sh

# 設定 caddy for laravel or normal project
./setup-caddy-rewrite.sh

printf "***** 完成 *****\n\n"

printf "執行以下指令啟動 container：\n"
printf "      docker-compose up -d\n\n"
