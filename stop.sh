#!/bin/bash

echo "Stoping the BTCZ full node ..."
bitcoinz-cli stop
sleep 3s

echo ""
echo "Stoping the BTCZ Insight explorer..."
pm2 stop all
pm2 delete all

sleep 3s
