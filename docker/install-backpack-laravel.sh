###################################
#
#  安裝 backpack for laravel
#
###################################
#!/bin/bash

./composer-php-fpm.sh require backpack/crud
sleep 5

echo ""
echo ">>>> php artisan backpack:base:install"
./php-artisan.sh backpack:base:install
sleep 3

echo ""
echo ">>>> php artisan backpack:crud:install"
./php-artisan.sh backpack:crud:install
sleep 3

echo ""
echo ">>>> 處理中文語系"
mv ../site/resources/lang/vendor/backpack/zh-Hant ../site/resources/lang/vendor/backpack/zh-TW
cp ../site/vendor/backpack/base/src/resources/lang/zh-hant/base.php ../site/resources/lang/vendor/backpack/zh-TW/base.php
echo "OK"
echo ""

read -p "是否安裝 backpack/permissionmanage？ [Y/n] " ans
if [[ $ans == "" ]] || [[ $ans == "Y" ]] || [[ $ans == "y" ]]; then
    echo "**** 安裝 backpack/permissionmanage"
    ./composer-php-fpm.sh require backpack/permissionmanager
    echo "**** 建立設定檔"
    ./php-artisan.sh vendor:publish --provider="Backpack\PermissionManager\PermissionManagerServiceProvider"
    echo "**** 建立資料表"
    ./php-artisan.sh migrate
    echo "**** 下載中文語系檔"
    if [[ ! -d tmp ]];then
        mkdir tmp
    fi
    cd tmp
    wget https://campus-xoops.tn.edu.tw/uploads/tad_book3/file/34/permissionmanager-zh-TW.zip
    unzip permissionmanager-zh-TW.zip
    mv zh-TW/permissionmanager.php ../../site/resources/lang/vendor/backpack/zh-TW/ && cd .. && rm -rf tmp

    echo "其餘調整請參考："
    echo "https://campus-xoops.tn.edu.tw/modules/tad_book3/page.php?tbdsn=1155"
fi

