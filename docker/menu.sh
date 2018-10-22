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

# 啟動容器子選單
function startServiceSubmenu() {
    while :
    do
     clear
     echo "********** 啟動容器 **********"
     echo "1. 全部啟動 (預設)"
     echo "2. 啟動 Caddy + php-fpm"
     echo "3. 啟動 MySQL"
     echo "4. 重新啟動 Caddy"
     echo "5. 重新啟動 php-fpm"
     echo "6. 重新啟動 MySQL"
     echo "s. 查看目前服務/容器狀態"
     echo "b. 返回上一層選單"
     echo -n "請輸入選項： "
     read opt
     case $opt in
      1|"") echo "************ 全部啟動 *************";
         $docker_compose up -d
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      2) echo "************ 啟動 Caddy + php-fpm *************";
         $docker_compose up -d caddy php-fpm
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      3) echo "************ 啟動 MySQL *************";
         $docker_compose up -d mysql
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      4) echo "************ 重新啟動 Caddy *************";
         $docker_compose restart caddy
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      5) echo "************ 重新啟動 php-fpm *************";
         $docker_compose restart php-fpm
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      4) echo "************ 重新啟動 MySQL *************";
         $docker_compose restart mysql
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;

      [sS]) echo "************ 查看目前服務/容器狀態 *************";
         $docker_compose ps
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;

      [bB]) # 返回上一層選單
        mainmenu;;

      *) echo "錯誤的選項： $opt";
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
    esac
    done
}


# Laravel 子選單
function laravelSubmenu() {
    while :
    do
     clear
     echo "********** Laravel 選單 **********"
     echo "1. 建立 Laravel 專案 (預設)"
     echo "2. 設定 Laravel 環境 .env"
     echo "3. 下載 Laravel 中文語系檔"
     echo "4. 設定 config/app.php"
     echo "5. 安裝 t301000/laravel-ntpc-openid"
     echo "b. 返回上一層選單"
     echo -n "請輸入選項： "
     read opt
     case $opt in
      1|"") echo "************ 建立 Laravel 專案 (預設) *************";
         ./laravel-new.sh
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      2) echo "************ 設定 Laravel 環境 .env *************";
         ./edit-laravel-env.sh
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      3) echo "************ 下載 Laravel 中文語系檔 *************";
         ./get-laravel-lang.sh
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      4) echo "************ 設定 config/app.php *************";
         ./edit-laravel-config-app-php.sh
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      5) echo "************ 安裝 t301000/laravel-ntpc-openid *************";
         ./install-laravel-ntpc-openid.sh
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;


      [bB]) # 返回上一層選單
        mainmenu;;

      *) echo "錯誤的選項： $opt";
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
    esac
    done
}


# 主選單
function mainmenu() {
    while :
    do
     clear
     echo "********** 主選單 **********"
     echo "1. 設定 Docker 環境 .env"
     echo "2. Laravel 選單"
     echo "3. 下載 adminer，建立 phpinfo.php"
     echo "4. 啟動容器"
     echo "5. 停止並移除容器"
     echo "6. 清除檔案：資料庫、web log"
     echo "7. 進入 php-fpm 容器"
     echo "p. 啟動 portainer 容器"
     echo "q. 離開"
     echo -n "請輸入選項： "
     read opt
     case $opt in
      1) echo "************ 設定 Docker 環境 .env *************";
         ./prepare.sh
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      2) # Laravel 選單
         laravelSubmenu;;
      3) echo "************ 下載 adminer，建立 phpinfo.php *************";
         ./get-adminer-phpinfo.sh
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      4) # 啟動容器選單
         startServiceSubmenu;;
      5) echo "************ 停止並移除容器 *************";
         ./down.sh
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      6) echo "************ 清除檔案：資料庫、web log *************";
         ./clean.sh
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
      7) echo "************ 進入 php-fpm 容器 *************";
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
         exit 1;;

      *) echo "錯誤的選項： $opt";
         echo "按下 [enter] 鍵繼續. . .";
         read enterKey;;
    esac
    done
}

# 執行主選單
mainmenu
