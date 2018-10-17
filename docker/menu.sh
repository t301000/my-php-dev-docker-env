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
 
while :
do
 clear
 echo "主選單"
 echo "1. 設定 Docker 環境"
 echo "2. 建立 Laravel 專案"
 echo "3. 設定 Laravel 環境"
 echo "4. 啟動容器"
 echo "5. 停止並移除容器"
 echo "6. 清除檔案：資料庫、web log"
 echo "7. 離開"
 echo -n "Please enter option [1 - 7] "
 read opt
 case $opt in
  1) echo "************ 設定 Docker 環境 *************";
     ./prepare.sh;;
  2) echo "************ 建立 Laravel 專案 *************";
     ./laravel-new.sh;;
  3) echo "************ 設定 Laravel 環境 *************";
     ./edit-laravel-env.sh;;
  4) echo "************ 啟動容器 *************";
     ./up.sh;;
  5) echo "************ 停止並移除容器 *************";
     ./down.sh;;
  6) echo "************ 清除檔案：資料庫、web log *************";
     ./clean.sh;;
  7) echo "************ 離開 *************";
     exit 1;;
  *) echo "錯誤的選項： $opt";
     echo "按下 [enter] 鍵繼續. . .";
     read enterKey;;
esac
done