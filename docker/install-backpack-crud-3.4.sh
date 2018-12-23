###################################
#
#  安裝 backpack for laravel
#  backpack/crud 3.4.*
#  backpack/permissionmanager 3.12.*
#
###################################
#!/bin/bash

# add Trait to User Model
function addTraitToUserModel () {
    read -p "User Model 相對於 app 之路徑含檔名？ (預設： User.php) " path
    if [[ $path == "" ]]; then
        path='User.php'
    fi

    echo ""
    echo ">>>> 在 app/$path 中加入 Traits： CrudTrait、HasRoles"

    trait1='use Backpack\\CRUD\\CrudTrait;'
    trait2='use Spatie\\Permission\\Traits\\HasRoles;'
    sed -i "/namespace App*/a \\\n${trait1}\n${trait2}" ../site/app/$path
    trait1='    use CrudTrait;'
    trait2='    use HasRoles;'
    sed -i "/use Notifiable;/a \\\n${trait1}\n${trait2}" ../site/app/$path
}

# 修改 config/auth.php 中 users provider 之 model
function modifyAuthUserModel () {
    echo ""
    echo ">>>> 修改 config/auth.php 中 users provider 之 model"
    echo ">>>>   App\User::class 改為 Backpack\Base\app\Models\BackpackUser::class"

    src="'model' => App\\\User"
    to="'model' => Backpack\\\Base\\\app\\\Models\\\BackpackUser"
    sed -i "s/${src}/${to}/g" ../site/config/auth.php
}

# 產生管制進入後台之 middleware
function generateMiddleware () {
    read -p "middleware 名稱？ (預設： AdminMiddleware) " name
    if [[ $name == "" ]]; then
        name='AdminMiddleware'
    fi

    ./php-artisan.sh make:middleware $name
    sleep 2

    read -p "permission 名稱？ (預設： 後台管理) " permission
    if [[ $permission == "" ]]; then
        permission='後台管理'
    fi

    path="../site/app/Http/Middleware/${name}.php"
    content="\
        if (!\$request->user()->hasAnyPermission('${permission}')) {\n\
            abort(403);\n\
        }"
    sed -i "/return \$next/ i \\${content}" $path

    echo "$name 已產生"
    
    path="../site/config/backpack/base.php"
    search="\\\Backpack\\\Base\\\app\\\Http\\\Middleware\\\CheckIfAdmin::class"
    middlewareClass="        \/\/ \\\App\\\Http\\\Middleware\\\\${name}::class,"
    sed -i "/${search}/ a \\${middlewareClass}" $path
    echo "已加入 $name 至 config/backpack/base.php 之 middleware_class"
    echo "但為註解狀態未啟用，請新增使用者賦予 ${permission} 權限後啟用之"
    echo "後台 url 為： /admin"
    echo ""
}


###############################

./composer-php-fpm.sh require backpack/crud:3.4.*
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
    ./composer-php-fpm.sh require backpack/permissionmanager:3.12.*
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

    read -p "是否在 User Model 中加入 Trait 並修改 config/auth.php？ [Y/n] " ans
    if [[ $ans == "" ]] || [[ $ans == "Y" ]] || [[ $ans == "y" ]]; then
        addTraitToUserModel
        modifyAuthUserModel
    fi

    echo ""
    echo ">>>> 在後台界面加入權限管理選項"
    echo ">>>>   resources/views/vendor/backpack/base/inc/sidebar_content.blade.php"
    cat backpack-sidebar-content-permission.txt >> ../site/resources/views/vendor/backpack/base/inc/sidebar_content.blade.php


    read -p "是否產生管制進入後台之 middleware？ [Y/n] " ans
    if [[ $ans == "" ]] || [[ $ans == "Y" ]] || [[ $ans == "y" ]]; then
        generateMiddleware
    fi


    echo "其餘調整請參考："
    echo "https://campus-xoops.tn.edu.tw/modules/tad_book3/page.php?tbdsn=1155"
fi

