###################################
#
#  安裝 recca0120/upload
#
#  https://github.com/recca0120/upload
#
###################################
#!/bin/bash

./composer-php-fpm.sh require recca0120/upload
sleep 3

echo ""
echo ">>>> publish config file"
./php-artisan.sh vendor:publish --provider="Recca0120\Upload\UploadServiceProvider"
sleep 2

echo ""
echo ">>>> finished"
echo ""

