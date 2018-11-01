###################################
#
#  install t301000/laravel-ntpc-openid
#
###################################
#!/bin/bash

./composer-php-fpm.sh require t301000/laravel-ntpc-openid
./php-artisan.sh vendor:publish --provider="T301000\LaravelNtpcOpenid\NtpcOpenidServiceProvider" --tag=config
./php-artisan.sh vendor:publish --provider="T301000\LaravelNtpcOpenid\NtpcOpenidServiceProvider" --tag=views

echo "// routes for NTPC OpenID" >> ../site/routes/web.php
echo "NTPCOpenID::routes();" >> ../site/routes/web.php
