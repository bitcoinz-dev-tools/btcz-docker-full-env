module.exports = {
  server: {
    port: 2255,
    updateEveryMinutes: 5,
  },
  blockchain: {
    api: [
	  {url:"http://127.0.0.1:3001", type: "insight"},
      {url:"https://explorer.btcz.app", type: "insight"},
      {url:"https://btczexplorer.blockhub.info", type: "iquidus"},
      {url:"https://explorer.btcz.rocks", type: "insight"},
    ],
  },
  rate: {
    api: [
	  "http://127.0.0.1:3333/rates",
      "https://masq.btcz.rocks/rates",
      "https://masq.btcz.app/rates",
    ],
    currency: ['BTC','USD','EUR'],
  },
}