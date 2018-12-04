###################################
#
#  menu for install package for laravel
#
###################################
#!/bin/bash

docker_compose="/usr/local/bin/docker-compose"

# laravel 選單
function menu() {
    while :
    do
        clear
        echo "********** 安裝 packages for laravel **********"
        echo ""
        echo "1. 安裝 t301000/laravel-ntpc-openid"
        echo "2. 安裝 barryvdh/laravel-ide-helper"
        echo "3. 安裝 backpack for laravel"
        echo "4. 安裝 recca0120/upload"
        echo ""
        echo "Debug tool:"
        echo "5. 安裝 laravel telescope"
        echo "6. 安裝 recca0120/laravel-tracy"
        echo "7. 安裝 barryvdh/laravel-debugbar"
        echo ""
        echo "----------"
        echo ""
        echo "q. 離開"
        echo ""
        echo -n "請輸入選項： "
        read opt
        case $opt in
            1) echo "************ 安裝 t301000/laravel-ntpc-openid *************";
                ./install-laravel-ntpc-openid.sh
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            2) echo "************ 安裝 barryvdh/laravel-ide-helper *************";
                ./install-ide-helper.sh
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            3) echo "************ 安裝 backpack for laravel *************";
                ./install-backpack-laravel.sh
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            4) echo "************ 安裝 recca0120/upload *************";
                ./install-recca0120_upload.sh
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            5) echo "************ 安裝 laravel telescope *************";
                ./install-laravel-telescope.sh
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            6) echo "************ 安裝 recca0120/laravel-tracy *************";
                ./install-recca0120_laravel-tracy.sh
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            7) echo "************ 安裝 barryvdh/laravel-debugbar *************";
                ./install-barryvdh_laravel-debugbar.sh
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