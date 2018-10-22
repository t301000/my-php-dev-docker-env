###################################
#
# 設定 Laravel config/app.php
#
###################################
#!/bin/bash

file_path="../site/config/app.php"

echo ">>>> 設定 Laravel config/app.php"
echo ""

echo "設定 timezone 為 Asia/Taipei"

sed -i "s/'timezone' => 'UTC'/'timezone' => 'Asia\/Taipei'/" $file_path

echo "設定 locale 為 zh-TW"

sed -i "s/'locale' => 'en'/'locale' => 'zh-TW'/" $file_path

