###################################
#
#  安裝 barryvdh/laravel-debugbar
#
#  https://github.com/barryvdh/laravel-debugbar
#
###################################
#!/bin/bash

./composer-php-fpm.sh require --dev barryvdh/laravel-debugbar
sleep 3

echo ""
echo ">>>> publish config file"
./php-artisan.sh vendor:publish --provider="Barryvdh\Debugbar\ServiceProvider"
sleep 2

echo ""
echo ">>>> finished"
echo ""

