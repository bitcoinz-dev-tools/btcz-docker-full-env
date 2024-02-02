# btcz-docker-full-env

<img src="https://steemitimages.com/DQmezupwdF4Ju2SCfE1fK6qkWNDhj12Sw7r1Um5m6FcFJrD/image.png"
 width="999"
  height="280" />

This docker image builds a complete BTCZ environment based on bitcore full node, Insight Explorer. Paper Wallet, Web Wallet, BTCZ Vault Info. API with BWS and rates API for the BitcoinZ Copay Wallet, multi-platform included Android on Google Play.
</div>
</div><div class="et_pb_column et_pb_column_1_4 et_pb_column_7  et_pb_css_mix_blend_mode_passthrough et-last-child">
<div class="et_pb_button_module_wrapper et_pb_button_6_wrapper et_pb_button_alignment_center et_pb_module ">
<a class="et_pb_button et_pb_button_6 et_animated et_pb_bg_layout_dark" href="https://github.com/bitcoinz-wallets/bitcoinz-copay-wallet/releases/tag/v10.2.0" target="_blank" data-icon="&#xf1d8;">Bitcoinz Copay Wallet Multiplatform </a>
</div>
</div><div class="et_pb_column et_pb_column_1_4 et_pb_column_7  et_pb_css_mix_blend_mode_passthrough et-last-child">
<div class="et_pb_button_module_wrapper et_pb_button_6_wrapper et_pb_button_alignment_center et_pb_module ">
<a class="et_pb_button et_pb_button_6 et_animated et_pb_bg_layout_dark" href="https://play.google.com/store/apps/details?id=com.btczcom.btcz&hl=en_ZA" target="_blank" data-icon="&#xf1d8;">Android Wallet </a>
</div>

That means you can run a full node wallet and connect from any device to your node using BitcoinZ Copay Wallet without middlemen. You can connect to your own network via VPN or port forwarding to BWS API.
After running the BitcoinZ full container you need only change BMS settings in the wallet with your IP address. 
By running this dock container  (full node wallet)  you helping with the decentralization.

<img src="https://shorturl.at/ezDJU"
 width="280"
  height="500" />

sudo docker pull simbav/bitcoinz-full  

sudo docker run -it -d --network="host" --name="bitcoinz-full" --restart=always  simbav/bitcoinz-full


These are the exposed Web services.

 - Insight explorer          http://127.0.0.1:3001/status
 - BTCZ Vault Info           http://127.0.0.1:2255
 - Rate API                  http://127.0.0.1:3333/rates
 - BWS API                   http://127.0.0.1:3232/bws/api
 - Paper Wallet              http://127.0.0.1:2265
 - Web Wallet                http://127.0.0.1:2275

################################
</div>
</div><div class="et_pb_column et_pb_column_1_4 et_pb_column_7  et_pb_css_mix_blend_mode_passthrough et-last-child">
<div class="et_pb_button_module_wrapper et_pb_button_6_wrapper et_pb_button_alignment_center et_pb_module ">
<a class="et_pb_button et_pb_button_6 et_animated et_pb_bg_layout_dark" href="https://getbtcz.com/" target="_blank" data-icon="&#xf1d8;">BTCZ Home Page</a>
</div>
</div>
</div><div class="et_pb_column et_pb_column_1_4 et_pb_column_6  et_pb_css_mix_blend_mode_passthrough">
<div class="et_pb_button_module_wrapper et_pb_button_5_wrapper et_pb_button_alignment_center et_pb_module ">
<a class="et_pb_button et_pb_button_5 et_animated et_pb_bg_layout_dark" href="https://Discord.gg/BitcoinZ" data-icon="&#xe102;">Join Discord</a>
</div>
</div>
</div><div class="et_pb_column et_pb_column_1_4 et_pb_column_7  et_pb_css_mix_blend_mode_passthrough et-last-child">
<div class="et_pb_button_module_wrapper et_pb_button_6_wrapper et_pb_button_alignment_center et_pb_module ">
<a class="et_pb_button et_pb_button_6 et_animated et_pb_bg_layout_dark" href="https://t.me/btczofficialgroup" target="_blank" data-icon="&#xf1d8;">Join Telegram</a>
</div>
</div><div class="et_pb_column et_pb_column_1_4 et_pb_column_7  et_pb_css_mix_blend_mode_passthrough et-last-child">
<div class="et_pb_button_module_wrapper et_pb_button_6_wrapper et_pb_button_alignment_center et_pb_module ">
<a class="et_pb_button et_pb_button_6 et_animated et_pb_bg_layout_dark" href="https://twitter.com/BTCZOfficial" target="_blank" data-icon="&#xf1d8;">Join Twitter</a>
</div>
</div><div class="et_pb_column et_pb_column_1_4 et_pb_column_7  et_pb_css_mix_blend_mode_passthrough et-last-child">
<div class="et_pb_button_module_wrapper et_pb_button_6_wrapper et_pb_button_alignment_center et_pb_module ">
<a class="et_pb_button et_pb_button_6 et_animated et_pb_bg_layout_dark" href="https://github.com/btcz/" target="_blank" data-icon="&#xf1d8;">Join GitHub</a>
</div>
</div><div class="et_pb_column et_pb_column_1_4 et_pb_column_7  et_pb_css_mix_blend_mode_passthrough et-last-child">
<div class="et_pb_button_module_wrapper et_pb_button_6_wrapper et_pb_button_alignment_center et_pb_module ">
<a class="et_pb_button et_pb_button_6 et_animated et_pb_bg_layout_dark" href="https://www.facebook.com/groups/bitcoinz.community" target="_blank" data-icon="&#xf1d8;">Join Facebook</a>
</div>
</div><div class="et_pb_column et_pb_column_1_4 et_pb_column_7  et_pb_css_mix_blend_mode_passthrough et-last-child">
<div class="et_pb_button_module_wrapper et_pb_button_6_wrapper et_pb_button_alignment_center et_pb_module ">
<a class="et_pb_button et_pb_button_6 et_animated et_pb_bg_layout_dark" href="https://www.facebook.com/groups/bitcoinz.community" target="_blank" data-icon="&#xf1d8;">Join Youtube</a>
</div>
</div><div class="et_pb_column et_pb_column_1_4 et_pb_column_7  et_pb_css_mix_blend_mode_passthrough et-last-child">
<div class="et_pb_button_module_wrapper et_pb_button_6_wrapper et_pb_button_alignment_center et_pb_module ">
<a class="et_pb_button et_pb_button_6 et_animated et_pb_bg_layout_dark" href="https://github.com/simbav911/btcz-docker-full-env" target="_blank" data-icon="&#xf1d8;">Source Code GitHub</a>
</div>
################################

Big Thanks to the Marcelus 👑


## Setup from the source code
The docker image `build` can take several hours.
```
git clone https://github.com/simbav911/btcz-docker-full-env.git
cd btcz-docker-full-env
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
