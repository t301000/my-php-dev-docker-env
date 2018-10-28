###################################
#
#  menu for start docker-compose services
#
###################################
#!/bin/bash

docker_compose="/usr/local/bin/docker-compose"

# 啟動服務/容器 選單
function menu() {
    while :
    do
        clear
        echo "********** 啟動服務/容器 **********"
        echo ""
        echo "1. 全部啟動 (預設)"
        echo "2. 啟動 Caddy + php-fpm"
        echo "3. 啟動 MySQL"
        echo "4. 重新啟動 Caddy"
        echo "5. 重新啟動 php-fpm"
        echo "6. 重新啟動 MySQL"
        echo ""
        echo "----------"
        echo ""
        echo "s. 查看目前服務/容器狀態"
        echo "q. 離開"
        echo ""
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
            6) echo "************ 重新啟動 MySQL *************";
                $docker_compose restart mysql
                echo "按下 [enter] 鍵繼續. . .";
                read enterKey;;

            [sS]) echo "************ 查看目前服務/容器狀態 *************";
                $docker_compose ps
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