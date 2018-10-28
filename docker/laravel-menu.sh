###################################
#
#  menu for laravel
#
###################################
#!/bin/bash

docker_compose="/usr/local/bin/docker-compose"

# laravel 選單
function menu() {
    while :
    do
        clear
        echo "********** Laravel 選單 **********"
        echo ""
        echo "1. 建立 Laravel 專案 (預設)"
        echo "2. 設定 Laravel 環境 .env"
        echo "3. 下載 Laravel 中文語系檔"
        echo "4. 設定 config/app.php"
        echo "5. artisan 選單"
        echo "6. packages 安裝選單"
        echo ""
        echo "----------"
        echo ""
        echo "s. 啟動全部服務/容器"
        echo "q. 離開"
        echo ""
        echo -n "請輸入選項： "
        read opt
        case $opt in
            1|"") echo "************ 建立 Laravel 專案 (預設) *************";
                ./laravel-new.sh
                echo ""
                echo "安裝版本："
                ./php-artisan.sh --version
                echo ""
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
            5) echo "************ artisan 選單 *************";
                ./artisan-menu.sh;;
            6) # 啟動 packages 安裝選單
                ./install-packages-for-laravel-menu.sh;;


            [sS]) echo "************ 啟動全部服務/容器 *************";
                $docker_compose up -d
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
                
            [qQ]) # 離開
                exit 0;;

            *) echo "錯誤的選項： $opt";
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
        esac
    done
}

# 執行選單
menu