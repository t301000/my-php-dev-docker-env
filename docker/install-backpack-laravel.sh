###################################
#
#  安裝 backpack for laravel
#
###################################
#!/bin/bash

read -p "backpack/crud 版本？  (預設： 3.5)  [3.4 / 3.5] " ver
if [[ $ver == "" ]] || [[ $ver == "3.5" ]]; then
    echo ">>>> 正在安裝 backpack/crud:3.5.*"
    ./install-backpack-crud-3.5.sh
fi

if [[ $ver == "3.4" ]]; then
    echo ">>>> 正在安裝 backpack/crud:3.4.*"
    ./install-backpack-crud-3.4.sh
fi
