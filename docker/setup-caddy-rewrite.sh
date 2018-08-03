#!/bin/bash
#
# 設定 caddy for laravel or normal project
#

#### 開始 ####

echo "***** 設定 Caddy 是否開啟 rewrite 功能 *****"
printf "按下 Ctrl + c 可中斷\n\n"


value=""
msg=""
read -p "是否開啟 rewrite 功能： (預設： N) [y/N] " value
if [[ "$value" == "y" ]] || [[ "$value" == "Y" ]]; then
    cp caddy/Caddyfile-rewrite caddy/Caddyfile
    msg="已開啟 rewrite 功能"
else
    cp caddy/Caddyfile-no-rewrite caddy/Caddyfile
    msg="未開啟 rewrite 功能"
fi

printf "\n>>> Caddy 設定完成，${msg}！！\n\n"
