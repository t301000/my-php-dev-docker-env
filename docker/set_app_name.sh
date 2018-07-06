#!/bin/bash
set -- "$PWD"
IFS="/"; declare -a STR_ARRAY=($*)
app=""
for x in "${STR_ARRAY[@]}"
do
    # echo "$x"
    if [[ $x != "docker" ]]; then
        app=$x
    fi  
done

value=""
read -p "專案名稱：(預設： ${app})  " value
if [[ "$value" != "" ]]; then
    app=$value
fi

echo "### 專案名稱 ###" >> .env
echo "APP_NAME=${app}" >> .env
