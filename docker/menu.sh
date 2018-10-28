#!/bin/bash
# A menu driven Shell script which has following options
# Contents of /etc/passwd
# List of users currently logged
# Prsent handling directory
# Exit
# As per option do the job
# -----------------------------------------------
# Copyright (c) 2005 nixCraft project <http://cyberciti.biz/fb/>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------

docker_compose="/usr/local/bin/docker-compose"


# 主選單
function mainmenu() {
    while :
    do
        clear
        echo "********** 主選單 **********"
        echo ""
        echo "1. 設定 Docker 環境 .env"
        echo "2. Laravel 選單"
        echo "3. 下載 adminer，建立 phpinfo.php"
        echo "4. 啟動容器"
        echo "5. 停止並移除容器"
        echo "6. 開啟 / 關閉 rewrite 並重新啟動 Caddy"
        echo "7. 清除檔案：資料庫、web log"
        echo "8. 進入 php-fpm 容器"
        echo ""
        echo "----------"
        echo ""
        echo "p. 啟動 portainer 容器"
        echo "q. 離開"
        echo ""
        echo -n "請輸入選項： "
        read opt
        case $opt in
            1) echo "************ 設定 Docker 環境 .env *************";
                ./prepare.sh
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            2) # Laravel 選單
                ./laravel-menu.sh;;
            3) echo "************ 下載 adminer，建立 phpinfo.php *************";
                ./get-adminer-phpinfo.sh
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            4) # 啟動容器選單
                ./start-services-menu.sh;;
            5) echo "************ 停止並移除容器 *************";
                ./down.sh
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            6) echo "************ 開啟 / 關閉 rewrite 並重新啟動 Caddy *************";
                ./setup-caddy-rewrite.sh
                echo ">>>> 重新啟動 Caddy ...."
                $docker_compose restart caddy
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            7) echo "************ 清除檔案：資料庫、web log *************";
                ./clean.sh
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            8) echo "************ 進入 php-fpm 容器 *************";
                ./enter-php-fpm.sh;;

            [pP]) echo "************ 啟動 portainer 容器 *************";
                echo -n "確定？ [y/N] "
                read ans
                if [[ "$ans" == "y" ]] || [[ "$ans" == "Y" ]]; then
                ./run_portainer.sh
                else
                echo "取消"
                fi
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;

            [qQ])
                exit 0;;

            *) echo "錯誤的選項： $opt";
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
        esac
    done
}

# 執行主選單
mainmenu
