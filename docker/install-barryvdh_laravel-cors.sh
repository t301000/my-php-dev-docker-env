###################################
#
#  安裝 barryvdh/laravel-cors
#
#  https://github.com/barryvdh/laravel-cors
#
###################################
#!/bin/bash

./composer-php-fpm.sh require barryvdh/laravel-cors
sleep 3

echo ""
echo ">>>> publish config file"
./php-artisan.sh vendor:publish --provider="Barryvdh\Cors\ServiceProvider"
sleep 2

echo ""
echo ">>>> finished"
echo ""

echo ">>>> 自行於適當位置添加 middleware"
echo "    參考： https://github.com/barryvdh/laravel-cors#global-usage"
echo ""
