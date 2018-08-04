######################################################################
#
# 下載 adminer and 產生 phpinfo.php
#
######################################################################

#!/bin/bash
ADMINER_VERSION="4.6.3"


value=""
read -p "下載 adminer：(預設： Y) [Y/n] " value
if [[ "$value" == "" ]] || [[ "$value" == "y" ]] || [[ "$value" == "Y" ]]; then
    curl -L https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php -o ../site/public/adminer.php
fi


value=""
read -p "產生 phpinfo.php：(預設： N) [y/N] " value
if [[ "$value" == "y" ]] || [[ "$value" == "Y" ]]; then
    PHP_INFO="../site/public/phpinfo.php"

    echo "<?php phpinfo(); ?>" > $PHP_INFO
    echo "phpinfo.php 已產生"
fi
