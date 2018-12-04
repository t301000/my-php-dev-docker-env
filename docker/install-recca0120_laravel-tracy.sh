###################################
#
#  安裝 recca0120/laravel-tracy
#
#  https://github.com/recca0120/laravel-tracy
#
###################################
#!/bin/bash

./composer-php-fpm.sh require --dev recca0120/laravel-tracy
sleep 3

echo ""
echo ">>>> publish config file"
./php-artisan.sh vendor:publish --provider="Recca0120\LaravelTracy\LaravelTracyServiceProvider"
sleep 2

echo ""
echo ">>>> finished"
echo ""

