###################################
#
#  安裝 laravel telescope
#
#  https://github.com/laravel/telescope
#
###################################
#!/bin/bash

./composer-php-fpm.sh require --dev laravel/telescope
sleep 3

echo ""
echo ">>>> publish assets"
./php-artisan.sh telescope:install
sleep 2

echo ""
echo ">>>> run php artisan migrate"
./php-artisan.sh migrate
sleep 2

echo ""
echo ">>>> finished"
echo ""
echo ">>>> 設定檔在： config/telescope.php"
echo ">>>> 路由為 /telescope，預設只能在 local 環境存取"
echo ">>>> 要在非 local 環境存取 telescope，請調整"
echo ">>>>    app/Providers/TelescopeServiceProvider.php 中的 gate 方法"
echo ""

