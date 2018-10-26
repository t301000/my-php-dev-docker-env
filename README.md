# 關於這個專案
這是我個人使用，基於 Docker 環境的 PHP 開發環境，建議的作業系統為 Debian based 與 CentOS 7。

## 各服務使用之容器
- Caddy
- php-fpm
- MySQL

## 如何使用
以命令列在 docker 目錄下執行 menu.sh

## 相關目錄
- docker： Docker 環境相關設定與腳本檔， .env 在此
- db_data：資料庫檔案與 SSL 憑證存放於此
- logs： Caddy server log
- site：網站檔案放置於此，Document root 為此目錄下的 public 目錄
