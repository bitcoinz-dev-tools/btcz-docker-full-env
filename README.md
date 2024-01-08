# btcz-docker-full-env
This docker image build a complete BTCZ environement based on bitcore node (Insight explorer and API with BWS and rates API)

## Setup
The docker image `build` can take several hours.
```
git clone https://github.com/MarcelusCH/btcz-docker-full-env.git
cd https://explorer.btcz.app
sudo docker build . -t btcz/full-env --network host
sudo docker create --network host --name btcz-full-env -it btcz/full-env
sudo docker start btcz-full-env
sudo docker exec -it btcz-full-env bash -c "btcz-start"
sudo docker exec -it btcz-full-env bash -c "pm2 status"
sudo docker exec -it btcz-full-env bash -c "bitcoinz-cli getinfo"
```

## URL's
This are the exposed Web services.
```
 - Insight explorer          http://127.0.0.1:3001/status
 - BTCZ Vault Info           http://127.0.0.1:2255
 - Rate API                  http://127.0.0.1:3333/rates
 - BWS API                   http://127.0.0.1:3232/bws/api
 - Paper Wallet              http://127.0.0.1:2265
 - Web Wallet                http://127.0.0.1:2275
```

## Web server Virtualhost config
Archlinux `httpd` server, virtual host config file (with proxy module).
```
<VirtualHost *:80>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/btcz_explorer"
    ServerName explorer.btcz.app
    ServerAlias explorer.btcz.rocks
    ErrorLog "/var/log/httpd/explorer.btcz.app-error_log"
    CustomLog "/var/log/httpd/explorer.btcz.app-access_log" common

    ProxyPass        / http://localhost:3001/
    ProxyPassReverse / http://localhost:3001/
    
    <Directory "/etc/httpd/docs/btcz_explorer">
        Require all granted
    </Directory>

</VirtualHost>
<VirtualHost *:443>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/btcz_explorer"
    ServerName explorer.btcz.app
    ServerAlias explorer.btcz.rocks
    ErrorLog "/var/log/httpd/explorer.btcz.app-error_log"
    CustomLog "/var/log/httpd/explorer.btcz.app-access_log" common

    ProxyPass        / http://localhost:3001/
    ProxyPassReverse / http://localhost:3001/

    <Directory "/etc/httpd/docs/btcz_explorer">
        Require all granted
    </Directory>

</VirtualHost>


<VirtualHost *:80>
    ServerAdmin marcelus.btcz@gmail.com         
    DocumentRoot "/etc/httpd/docs/btcz_wallet"
    ServerName wallet.btcz.app 
    ServerAlias wallet.btcz.rocks       
    ErrorLog "/var/log/httpd/explorer.btcz.app-error_log"
    CustomLog "/var/log/httpd/explorer.btcz.app-access_log" common

    ProxyPass        / http://localhost:2275/
    ProxyPassReverse / http://localhost:2275/

    <Directory "/etc/httpd/docs/btcz_wallet">
        Require all granted
    </Directory>

</VirtualHost>
<VirtualHost *:443>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/btcz_wallet"
    ServerName wallet.btcz.app
    ServerAlias wallet.btcz.rocks
    ErrorLog "/var/log/httpd/explorer.btcz.app-error_log"
    CustomLog "/var/log/httpd/explorer.btcz.app-access_log" common

    ProxyPass        / http://localhost:2275/
    ProxyPassReverse / http://localhost:2275/

    <Directory "/etc/httpd/docs/btcz_wallet">
        Require all granted
    </Directory>

</VirtualHost>


<VirtualHost *:80>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/bws"
    ServerName bws.btcz.app
    ServerAlias bws.btcz.rocks
    ErrorLog "/var/log/httpd/bws.btcz.app-error_log"
    CustomLog "/var/log/httpd/bws.btcz.app-access_log" common

    ProxyPass        / http://localhost:3232/
    ProxyPassReverse / http://localhost:3232/

    <Directory "/etc/httpd/docs/bws">
        Require all granted
    </Directory>

</VirtualHost>
<VirtualHost *:443>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/bws"
    ServerName bws.btcz.app
    ServerAlias bws.btcz.rocks
    ErrorLog "/var/log/httpd/bws.btcz.app-error_log"
    CustomLog "/var/log/httpd/bws.btcz.app-access_log" common

    ProxyPass        / http://localhost:3232/
    ProxyPassReverse / http://localhost:3232/

    <Directory "/etc/httpd/docs/bws">
        Require all granted
    </Directory>

</VirtualHost>


<VirtualHost *:80>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/masq"
    ServerName masq.btcz.app
    ServerAlias masq.btcz.rocks
    ErrorLog "/var/log/httpd/masq.btcz.app-error_log"
    CustomLog "/var/log/httpd/masq.btcz.app-access_log" common

    ProxyPass        / http://localhost:3333/
    ProxyPassReverse / http://localhost:3333/

    <Directory "/etc/httpd/docs/masq">
        Require all granted
    </Directory>

</VirtualHost>
<VirtualHost *:443>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/masq"
    ServerName masq.btcz.app
    ServerAlias masq.btcz.rocks
    ErrorLog "/var/log/httpd/masq.btcz.app-error_log"
    CustomLog "/var/log/httpd/masq.btcz.app-access_log" common

    ProxyPass        / http://localhost:3333/
    ProxyPassReverse / http://localhost:3333/

    <Directory "/etc/httpd/docs/masq">
        Require all granted
    </Directory>

</VirtualHost>


<VirtualHost *:80>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/vaultz"
    ServerName vaultz.btcz.app
    ServerAlias vaultz.btcz.rocks
    ErrorLog "/var/log/httpd/vaultz.btcz.app-error_log"
    CustomLog "/var/log/httpd/vaultz.btcz.app-access_log" common

    ProxyPass        / http://localhost:2255/
    ProxyPassReverse / http://localhost:2255/

    <Directory "/etc/httpd/docs/vaultz">
        Require all granted
    </Directory>

</VirtualHost>
<VirtualHost *:443>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/vaultz"
    ServerName vaultz.btcz.app
    ServerAlias vaultz.btcz.rocks
    ErrorLog "/var/log/httpd/vaultz.btcz.app-error_log"
    CustomLog "/var/log/httpd/vaultz.btcz.app-access_log" common

    ProxyPass        / http://localhost:2255/
    ProxyPassReverse / http://localhost:2255/

    <Directory "/etc/httpd/docs/vaultz">
        Require all granted
    </Directory>

</VirtualHost>


<VirtualHost *:80>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/btcz_paper"
    ServerName paper.btcz.app
    ServerAlias paper.btcz.rocks
    ErrorLog "/var/log/httpd/explorer.btcz.app-error_log"
    CustomLog "/var/log/httpd/explorer.btcz.app-access_log" common

    ProxyPass        / http://localhost:2265/
    ProxyPassReverse / http://localhost:2265/

    <Directory "/etc/httpd/docs/btcz_paper">
        Require all granted
    </Directory>

</VirtualHost>
<VirtualHost *:443>
    ServerAdmin marcelus.btcz@gmail.com
    DocumentRoot "/etc/httpd/docs/btcz_paper"
    ServerName paper.btcz.app
    ServerAlias paper.btcz.rocks
    ErrorLog "/var/log/httpd/explorer.btcz.app-error_log"
    CustomLog "/var/log/httpd/explorer.btcz.app-access_log" common

    ProxyPass        / http://localhost:2265/
    ProxyPassReverse / http://localhost:2265/

    <Directory "/etc/httpd/docs/btcz_paper">
        Require all granted
    </Directory>

</VirtualHost>
```
