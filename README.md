# 關於這個專案
這是我個人使用，基於 Docker 環境的 PHP 開發環境，建議的作業系統為 Debian based 與 CentOS 7。

## 各服務使用之容器
- Caddy
- php-fpm
- MySQL

## 如何使用
以下動作皆以命令列在 docker 目錄下執行。
1. 若未安裝過 Docker 與 docker-compose，則執行 install-docker.sh
1. 執行 prepare.sh，設定 .env
1. 執行 docker-compose up -d 啟動 container
1. 若有需要 GUI 的容器管理工具，則執行 run_portainer.sh 啟動 portainer 容器，開啟 localhost:9000 進行管理，預設 9000 port

## 相關目錄
- docker： Docker 環境相關設定與腳本檔， .env 在此
- db_data：資料庫檔案與 SSL 憑證存放於此
- logs： Caddy server log
- site：網站檔案放置於此，Document root 為此目錄下的 public 目錄
