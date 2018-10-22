###################################
#
# 下載 Laravel 中文語系檔
#
###################################
#!/bin/bash

echo ">>>> 下載 Laravel 中文語系檔...."
echo ""

url="https://github.com/caouecs/Laravel-lang/archive/master.zip"

laravel_lang_dir="../site/resources/lang"

if [[ ! -d tmp ]];then
    mkdir tmp
fi

cd tmp
wget $url
unzip master.zip
mv Laravel-lang-master/src/zh-TW ../$laravel_lang_dir/ && cd .. && rm -rf tmp


