###################################
#
#  安裝 backpack for laravel
#
###################################
#!/bin/bash
ver="3.6"
read -p "backpack/crud 版本？  (預設： 3.6)  [3.4 / 3.5 / 3.6] " my_ver
if [[ $my_ver == "" ]] || [[ $my_ver == "3.5" ]] || [[ $my_ver == "3.6" ]]; then
    if [[ $my_ver != "" ]]; then
        ver=$my_ver
    fi
    echo ">>>> 正在安裝 backpack/crud:${ver}.*"
    ./install-backpack-crud-3.5.sh
fi

if [[ $my_ver == "3.4" ]]; then
    echo ">>>> 正在安裝 backpack/crud:3.4.*"
    ./install-backpack-crud-3.4.sh
fi
