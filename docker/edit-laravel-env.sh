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
    echo ""
    echo "將抓取 docker-compose 的設定值"
        
    db_host="DB_HOST=mysql"

    default=`cat .env |grep ^MYSQL_DATABASE= | awk 'BEGIN {FS="="}; {print $2}'`
    db_database="DB_DATABASE=${default}"

    default=`cat .env |grep ^MYSQL_USER= | awk 'BEGIN {FS="="}; {print $2}'`
    db_username="DB_USERNAME=${default}"

    default=`cat .env |grep ^MYSQL_PASSWORD= | awk 'BEGIN {FS="="}; {print $2}'`
    db_password="DB_PASSWORD=${default}"

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


