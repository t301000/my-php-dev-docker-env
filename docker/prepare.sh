#!/bin/bash

lsb_dist=""
# Every system that we officially support has /etc/os-release
if [ -r /etc/os-release ]; then
    lsb_dist="$(. /etc/os-release && echo "$ID")"
fi

if [ "$lsb_dist" == "centos" ]; then
    sudo yum install -y vim curl git unzip wget
else
    sudo apt install -y vim curl git unzip wget
fi

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

printf "***** 完成 *****\n\n"

printf "執行以下指令啟動 container：\n"
printf "      docker-compose up -d\n\n"
