###################################
#
#  menu for php artisan
#
###################################
#!/bin/bash

# php artisan 主選單
function mainmenu() {
    while :
    do
        clear
        echo "********** php artisan 選單 **********"
        echo ""
        echo "0. 查看 laravel 版本"
        echo "1. make:auth"
        echo "2. migrate"
        echo "3. migrate:rollback"
        echo "4. migrate:refresh"
        echo ""
        echo "----------"
        echo ""
        echo "p. 進入 php-fpm 容器"
        echo "q. 離開"
        echo ""
        echo -n "請輸入選項： "
        read opt
        case $opt in
            0) echo "************ 查看 laravel 版本 *************";
                ./php-artisan.sh --version
                echo ""
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            1) echo "************ php artisan make:auth *************";
                ./php-artisan.sh make:auth
                echo ""
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            2) echo "************ php artisan migrate *************";
                ./php-artisan.sh migrate
                echo ""
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            3) echo "************ php artisan migrate:rollback *************";
                ./php-artisan.sh migrate:rollback
                echo ""
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
            4) echo "************ php artisan migrate:refresh *************";
                ./php-artisan.sh migrate:refresh
                echo ""
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;

            [pP]) # 進入 php-fpm 容器
                ./enter-php-fpm.sh;;

            [qQ]) # 主要選單
                exit 0;;

            *) echo "錯誤的選項： $opt";
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;
        esac
    done
}

# 執行主選單
mainmenu