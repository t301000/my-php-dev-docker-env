# 關於這個專案
這是我個人使用，基於 Docker 環境的 PHP 開發環境，建議的作業系統為 Debian based 與 CentOS 7。

## 各服務使用之容器
- Caddy
- php-fpm
- MySQL

## 如何使用
以下動作皆以命令列在 docker 目錄下執行。
1. 若未安裝過 Docker 與 docker-compose，則執行 install-docker.sh
1. 執行 prepare.sh，設定 .env 中資料庫資訊
1. 執行 setup-caddy-rewrite.sh 以設定 Caddy 是否啟用 URL rewrite
1. 執行 docker-compose up -d 啟動 container
1. 若有需要 GUI 的容器管理工具，則執行 run_portainer.sh 啟動 portainer 容器，開啟 localhost:9000 進行管理，預設 9000 port
1. 執行 composer.sh 可以使用 composer
1. 執行 laravel-new.sh 可以新建 laravel 專案，放置於與 docker 目錄同一層的 site 目錄（若已存在會先備份）
1. 若要執行 laravel 專案，則 .env 中 PHP 版本須視需要變更，docker-compose-prod.yml 中 php-fpm tag 也須視需要變更
1. 執行 edit-laravel-env.sh 可以編輯 Laravel .env 檔（使用 vim）
1. 執行 php-artisan.sh 可以進入 php-fpm 容器中執行 php artisan 指令
1. 執行 composer-php-fpm.sh 可以進入 php-fpm 容器中執行 composer 指令
1. 執行 enter-php-fpm.sh 可以進入 php-fpm 容器中 bash 環境
1. 執行 get-adminer-phpinfo.sh 可下載 adminer 與產生 phpinfo.php 於 site/public 之下

## 相關目錄
- docker： Docker 環境相關設定與腳本檔， .env 在此
- db_data：資料庫檔案與 SSL 憑證存放於此
- logs： Caddy server log
- site：網站檔案放置於此，Document root 為此目錄下的 public 目錄
