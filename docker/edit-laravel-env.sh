###################################
#
# 編輯 Laravel 環境設定檔
#
###################################
#!/bin/bash

echo ">>>> 編輯 Laravel 環境設定檔...."
echo ""

file_path="../site/.env"

db_host=""
db_database=""
db_username=""
db_password=""
db_host_orig="DB_HOST=127.0.0.1"
db_database_orig="DB_DATABASE=homestead"
db_username_orig="DB_USERNAME=homestead"
db_password_orig="DB_PASSWORD=secret"


read -p "以 vim 編輯？ [y/N] " ans
if [[ $ans == "Y" ]] || [[ $ans == "y" ]]; then
    vim $file_path
else
    read -p "DB_HOST ？ (預設： mysql) " ans
    if [[ $ans == "" ]]; then
        ans="mysql"
    fi
    db_host="DB_HOST=${ans}"

    read -p "DB_DATABASE ？ (預設： default) " ans
    if [[ $ans == "" ]]; then
        ans="default"
    fi
    db_database="DB_DATABASE=${ans}"

    read -p "DB_USERNAME ？ (預設： default) " ans
    if [[ $ans == "" ]]; then
        ans="default"
    fi
    db_username="DB_USERNAME=${ans}"

    read -p "DB_PASSWORD ？ (預設： secret) " ans
    if [[ $ans == "" ]]; then
        ans="secret"
    fi
    db_password="DB_DATABASE=${ans}"

    echo ""
    echo "以下是您的設定："
    echo $db_host
    echo $db_database
    echo $db_username
    echo $db_password
    echo ""

    read -p "是否正確？ [Y/n] " ans
    if [[ $ans == "" ]] || [[ $ans == "Y" ]] || [[ $ans == "y" ]]; then
        echo "**** 設定 laravel .env 中"
        sed -i "s/DB_HOST=127.0.0.1/$db_host/g" $file_path
        sed -i "s/DB_DATABASE=homestead/$db_database/g" $file_path
        sed -i "s/DB_USERNAME=homestead/$db_username/g" $file_path
        sed -i "s/DB_PASSWORD=secret/$db_password/g" $file_path
        echo "**** 設定 laravel .env 完成"
    fi

    echo "**** 未變更 laravel .env"

fi


