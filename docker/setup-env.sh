#!/bin/bash
#
# 設定 .env
#

MYSQL_DATABASE="default"
MYSQL_USER="default"
MYSQL_PASSWORD="secret"
#MYSQL_PORT="3306"
MYSQL_ROOT_PASSWORD="root"

PHP_VER="7.0"

#### 開始 ####

echo ""
echo "***** 設定 PHP 版本與 MySQL *****"
printf "按下 Ctrl + c 可中斷\n\n"


value=""
read -p "PHP 版本：(預設： 7.0) [7.0 / 7.1 / 7.2] " value
if [[ "$value" != "" ]]; then
    PHP_VER=$value
fi


value=""
read -p "資料庫名稱：(預設： default)  " value
if [[ "$value" != "" ]]; then
    MYSQL_DATABASE=$value
fi

value=""
read -p "資料庫帳號：(預設： default)  " value
if [[ "$value" != "" ]]; then
    MYSQL_USER=$value
fi

value=""
read -p "資料庫密碼：(預設： secret)  " value
if [[ "$value" != "" ]]; then
    MYSQL_PASSWORD=$value
fi

value=""
read -p "資料庫 root 密碼：(預設： root)  " value
if [[ "$value" != "" ]]; then
    MYSQL_ROOT_PASSWORD=$value
fi

#value=""
#read -p "資料庫 port：(預設： 3306)  " value
#if [[ "$value" != "" ]]; then
#    MYSQL_PORT=$value
#fi

sed -i "s/^PHP_VERSION=.*/PHP_VERSION=${PHP_VER}/" .env


echo "MYSQL_DATABASE=${MYSQL_DATABASE}" >> .env
echo "MYSQL_USER=${MYSQL_USER}" >> .env
echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}" >> .env
echo "MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}" >> .env
#echo "MYSQL_PORT=${MYSQL_PORT}" >> .env


# 設定專案名稱，供設定 container name 之用
./set_app_name.sh

printf "\n>>> .env 設定完成！！\n\n"
