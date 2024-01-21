FROM	 --platform=linux/amd64 archlinux:latest


# Update and install OS dependencies
RUN	 	 pacman-key --init
RUN	 	 pacman -Syu --noconfirm
RUN	 	 pacman -S base-devel --noconfirm
RUN      pacman -S nano git curl sed zip unzip --noconfirm


# Add an user as sudoer to e able to use makepkg and npm install as non root user
RUN	 	 useradd -m adminbtcz
RUN	 	 passwd -d adminbtcz
RUN 	 chmod 0440 /etc/sudoers
RUN 	 echo "adminbtcz ALL=(ALL)  ALL" >> /etc/sudoers


# Switch as adminbtcz (sudoer) user to continue
USER 	 adminbtcz


# Clone and build Python2 
WORKDIR	 /home/adminbtcz/
RUN	 	 git clone https://aur.archlinux.org/python2.git
WORKDIR  /home/adminbtcz/python2/
RUN      makepkg -si --noconfirm || true
RUN      rm -R /home/adminbtcz/python2/


# Clone and build YAY packager
WORKDIR  /home/adminbtcz/
RUN	 	 git clone https://aur.archlinux.org/yay.git
WORKDIR	 /home/adminbtcz/yay/
RUN	 	 makepkg -si --noconfirm
RUN 	 rm -R /home/adminbtcz/yay/


# Install Python 2.7 & zeroqm libs
RUN	 	 yay -Syu --noconfirm
RUN	 	 yay -S python2-bin --noconfirm
RUN	 	 sudo ln -sfn /usr/bin/python2  /usr/bin/python
RUN	 	 yay -S zeromq --noconfirm


# Install the Mongo DB
RUN	 	 yay -S mongodb34-bin --noconfirm
RUN	 	 sudo mkdir /data && sudo mkdir /data/db


# Install the BTCZ binaries
RUN	 	 mkdir /home/adminbtcz/bitcoinz
WORKDIR  /home/adminbtcz/bitcoinz
RUN 	 curl -L -o bitcoinz-2.0.8-EXT-6c6447fba1-ubuntu1604-linux64.zip https://github.com/btcz/bitcoinz/releases/download/2.0.8-EXT/bitcoinz-2.0.8-EXT-6c6447fba1-ubuntu1604-linux64.zip
RUN 	 unzip bitcoinz-2.0.8-EXT-6c6447fba1-ubuntu1604-linux64.zip
RUN	 	 chmod +x -R ./
RUN	 	 rm bitcoinz-2.0.8-EXT-6c6447fba1-ubuntu1604-linux64.zip


# Install nodejs 8
ENV      NVM_DIR /home/adminbtcz/.nvm       
ENV      NODE_VERSION 8.17.0 
RUN      sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
         && . $NVM_DIR/nvm.sh \
         && nvm install $NODE_VERSION \
         && nvm alias default $NODE_VERSION \
         && nvm use default
ENV      NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV      PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN 	 npm config set registry https://registry.npmjs.org/

RUN		 npm install -g yarn
RUN      npm -g install pm2



# echo for debug ...
# RUN      echo "" \
#          && echo "======== DEBUG ========" \
#          && python --version \
#          && echo "node : " $(node -v) \
#          && echo "npm  : " $(npm -v) \
#          && ls -la \
#          && echo "" && sleep 5s


# Install the bitcore-node-btcz & the Insight explorer
WORKDIR  /home/adminbtcz/
RUN	 	 git clone https://github.com/MarcelusCH/bitcore-node-btcz.git
WORKDIR  /home/adminbtcz/bitcore-node-btcz/
RUN      npm  install --verbose 
RUN	 	 sudo ln -sfn /home/adminbtcz/bitcore-node-btcz/bin/bitcore-node  /usr/bin/bitcore-node
WORKDIR  /home/adminbtcz/
RUN	 	 bitcore-node create btcz-explorer
WORKDIR  /home/adminbtcz/btcz-explorer/
RUN	 	 rm -R /home/adminbtcz/btcz-explorer/data/
RUN	 	 bitcore-node install MarcelusCH/insight-api-btcz MarcelusCH/insight-ui-btcz


# Install the VaultZ
WORKDIR  /home/adminbtcz/
RUN	 	 git clone https://github.com/bitcoinz-sites/BtcZ-VaultZ-Info.git
WORKDIR  /home/adminbtcz/BtcZ-VaultZ-Info/
RUN      npm  install --verbose 


# Install the rates API
WORKDIR  /home/adminbtcz/
RUN	 	 git clone https://github.com/bitcoinz-wallets/btcz-rates-api.git
WORKDIR  /home/adminbtcz/btcz-rates-api/
RUN      npm  install --verbose 


# Install the BWS
WORKDIR  /home/adminbtcz/
RUN	 	 git clone https://github.com/MarcelusCH/bitcore-wallet-service.git
WORKDIR  /home/adminbtcz/bitcore-wallet-service/
RUN      npm  install --verbose 


# Install the paper wallet
WORKDIR  /home/adminbtcz/
RUN	 	 git clone https://github.com/bitcoinz-sites/paper.btcz.rocks.git
WORKDIR  /home/adminbtcz/paper.btcz.rocks/ 
RUN 	 yarn install --verbose 


# Install the web wallet
WORKDIR  /home/adminbtcz/
RUN	 	 git clone https://github.com/bitcoinz-wallets/web-wallet.git
WORKDIR  /home/adminbtcz/web-wallet/


# Switch back to root user to finalize
USER     root


# Install nodejs 8 for root user
ENV 	 NVM_DIR /root/.nvm
ENV 	 NODE_VERSION 8.17.0
RUN      sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    	 && . $NVM_DIR/nvm.sh \
    	 && nvm install $NODE_VERSION \
    	 && nvm alias default $NODE_VERSION \
    	 && nvm use default
ENV 	 NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV 	 PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN      npm -g install pm2


# Copy the configuration files, fetch btcz params and link some binaries
RUN 	 /home/adminbtcz/bitcoinz/fetch-params.sh
RUN	 	 mkdir /root/.bitcoinz/
COPY	 bitcoinz.conf /root/.bitcoinz/bitcoinz.conf
COPY	 bitcore-node.json /home/adminbtcz/btcz-explorer/bitcore-node.json
COPY	 vaultz-conf.js /home/adminbtcz/BtcZ-VaultZ-Info/config.js
COPY	 rates-api.js /home/adminbtcz/btcz-rates-api/index.js
COPY	 bws-conf.js /home/adminbtcz/bitcore-wallet-service/config.js
COPY	 start.sh /start.sh
COPY	 init.sh /init.sh
COPY	 stop.sh /stop.sh
RUN	 	 chmod +x /start.sh
RUN      chmod +x /init.sh
RUN      chmod +x /stop.sh
RUN 	 ln -sfn /home/adminbtcz/.nvm/versions/node/v8.17.0/bin/pm2  /usr/bin/pm2
RUN	 	 ln -sfn /home/adminbtcz/.nvm/versions/node/v8.17.0/bin/node  /usr/bin/node
RUN	 	 ln -sfn /home/adminbtcz/.nvm/versions/node/v8.17.0/bin/npm  /usr/bin/npm
RUN      ln -sfn /start.sh  /usr/bin/btcz-start
RUN      ln -sfn /stop.sh  /usr/bin/btcz-stop
RUN      ln -sfn /init.sh  /usr/bin/btcz-init
RUN      ln -sfn /home/adminbtcz/bitcoinz/bitcoinzd  /usr/bin/bitcoinzd
RUN      ln -sfn /home/adminbtcz/bitcoinz/bitcoinz-cli  /usr/bin/bitcoinz-cli
RUN      ln -sfn /home/adminbtcz/bitcoinz/bitcoinz-tx  /usr/bin/bitcoinz-tx


# Generate a random password for the BTCZ RPC 
RUN	 	 genrpcpwd=$(echo $RANDOM | md5sum | head -c 20)
RUN	 	 sed -i 's/MyRPCpwdToChange/$genrpcpwd/g' /root/.bitcoinz/bitcoinz.conf
RUN      sed -i 's/MyRPCpwdToChange/$genrpcpwd/g' /home/adminbtcz/btcz-explorer/bitcore-node.json




# Debug ...
RUN      echo "" \ 
		 && echo "" \
		 && echo "" \
		 && echo "" \
		 && echo "=======================================================================================" \
         && echo "               BTCZ Bitcore Insight API/UI and other utilities installed  " \
		 && echo "=======================================================================================" \
		 && echo "" \
		 && echo "" \
		 && echo "" \
		 && echo "  BTCZ Bitcore node (1979) & Insight explorer with API (3001) installed !" \
		 && echo "" \
		 && echo "  ... Just waiting 30 secondes ;-) " \
		 && echo "      > Run, exit and start again the container to access this local services : " \
		 && echo "         * BWS (3232)" \
		 && echo "         * VaultZ (2255)" \
		 && echo "         * Rate API (3333)" \
		 && echo "         * Paper Wallet (2265)" \
		 && echo "         * Web Wallet (2275)" \
		 && echo "         * Copay Wallet (8100)" \
		 && echo "" \
		 && echo "" \
		 && echo "" \
		 && echo "=======================================================================================" \
		 && echo "" \
		 && echo "" \
		 && echo "" \
		 && echo "" \
         && echo "" && sleep 30s

# Dockerfile tells Docker that a container listens for traffic on the specified port. 
#Insight explorer
EXPOSE 3001
#VaultZ 
EXPOSE 2255
#Rate API
EXPOSE 3333
#BWS API
EXPOSE 3232 
#Paper Wallet
EXPOSE 2265
#Web Wallet
EXPOSE 2275
ENTRYPOINT ["/bin/bash"]
CMD ["btcz-start"]

















#run ls -la
#run ls -la

# Install the Copay Wallet
#WORKDIR  /home/admin/
#RUN	 	 git clone https://github.com/MarcelusCH/bitcoinz-copay-wallet.git
#WORKDIR  /home/admin/bitcoinz-copay-wallet/
#COPY	 copay-bws-url.js /home/admin/bitcoinz-copay-wallet/src/js/controllers/preferencesBwsUrl.js
#RUN      npm  install --verbose ... node 10
#	      ionic@2.0.0

#			npm install -g bower
#			bower install
#RUN		 npm install @ionic/v1-toolkit@2.0.0
#docker exec -u root container_1 chmod 777 











# sudo docker build . -t btcz/full-env --network host
# sudo docker create --network host --name btcz-full-env -it btcz/full-env
# ... exit (inside docker)
#
# sudo docker start btcz-full-env
# sudo docker exec -it btcz-full-env bash -c "btcz-start"
# sudo docker exec -it btcz-full-env bash -c "pm2 status"
# sudo docker exec -it btcz-full-env bash -c "bitcoinz-cli getinfo"
# 
# http://127.0.0.1:3001/status 








