var config = {
  basePath: '/bws/api',
  disableLogs: false,
  port: 3232,


  storageOpts: {
    mongoDb: {
      uri: 'mongodb://localhost:27017/bws',
    },
  },
  lockOpts: {
    //  To use locker-server, uncomment this:
    lockerServer: {
      host: 'localhost',
      port: 3231,
    },
  },
  messageBrokerOpts: {
    //  To use message broker server, uncomment this:
    messageBrokerServer: {
      url: 'http://localhost:3380',
    },
  },
  blockchainExplorerOpts: {
    btcz: {
      livenet: {
        provider: 'insight',
        //url: 'https://explorer.btcz.app',
		url: 'http://127.0.0.1:3001',
      },
      //testnet: {
       // provider: 'insight',
       // url: 'http://test.explorer.btcz.app',
      //},
    }
  },
  pushNotificationsOpts: {
    templatePath: './lib/templates',
    defaultLanguage: 'en',
    defaultUnit: 'btcz',
    subjectPrefix: '',
    pushServerUrl: 'https://fcm.googleapis.com/fcm',
    authorizationKey: '',
  },
  fiatRateServiceOpts: {
    defaultProvider: 'BitPay',
    fetchInterval: 60, // in minutes
  },

};
module.exports = config;