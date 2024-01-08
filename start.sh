#!/bin/bash

echo ""
echo "Starting the BTCZ full node ..."
cliGetInfo=$(bitcoinz-cli getinfo)

if [[ "$cliGetInfo" == *"version"* ]]; then
  echo " > BitcoinZ node already running."
else
  echo "Error quering full node, starting the deamon..."
  bitcoinzd
  echo " > Wait 10 second."
  sleep 10	

  cliGetInfo=$(bitcoinz-cli getinfo)
  if [[ "$cliGetInfo" == *"version"* ]]; then
    echo " > BitcoinZ node running."
  else
    echo " > BitcoinZ node still not running. Will check again later..."
  fi

fi

echo ""
echo "starting the BTCZ Insight explorer..."
cd /home/adminbtcz/btcz-explorer && pm2 start 'bitcore-node start'


cd /home/adminbtcz/btcz-rates-api && pm2 start 'node index.js'
cd /home/adminbtcz/BtcZ-VaultZ-Info && pm2 start 'node btcz-vaultz-info.js'

pm2 start mongod
sleep 10s

cd /home/adminbtcz/bitcore-wallet-service/locker && pm2 start 'node locker.js'
cd /home/adminbtcz/bitcore-wallet-service/messagebroker && pm2 start 'node messagebroker.js'
cd /home/adminbtcz/bitcore-wallet-service/bcmonitor && pm2 start 'node bcmonitor.js'
cd /home/adminbtcz/bitcore-wallet-service/emailservice && pm2 start 'node emailservice.js'
cd /home/adminbtcz/bitcore-wallet-service/pushnotificationsservice && pm2 start 'node pushnotificationsservice.js'
cd /home/adminbtcz/bitcore-wallet-service/fiatrateservice && pm2 start 'node fiatrateservice.js'
cd /home/adminbtcz/bitcore-wallet-service && pm2 start 'node bws.js'

#cd /home/admin/bitcoinz-copay-wallet && pm2 start 'npm start'


cd /home/adminbtcz/paper.btcz.rocks && pm2 start 'PORT=2265 node node_modules/react-scripts/bin/react-scripts.js start'
cd /home/adminbtcz/web-wallet/docs && pm2 start 'python -m SimpleHTTPServer 2275'







echo ""
echo "Execute 'bitcoinz-cli getinfo' cli :"
echo ""
bitcoinz-cli getinfo
echo ""
echo ""
echo "URL links :"
echo " - Insight explorer          http://127.0.0.1:3001/status"
echo " - BTCZ Vault Info           http://127.0.0.1:2255"
echo " - Rate API                  http://127.0.0.1:3333/rates"
echo " - BWS API                   http://127.0.0.1:3232/bws/api"
echo " - Paper Wallet              http://127.0.0.1:2265"
echo " - Web Wallet                http://127.0.0.1:2275"
#echo " - Copay Wallet              http://127.0.0.1:8100"
echo ""

sleep 3s
exit
