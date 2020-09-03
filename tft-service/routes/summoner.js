var express = require('express');
var router = express.Router();
const axios = require('axios');

const Summoner = require('../models/summoner');
const key = require('../constants/constants').api;

const lookUpSummoner = async (name) => {
  let url = 'https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/' + name.split(' ').join("%20"); 
  return await axios({
    method: 'get',
    url,
    headers: {
      'X-RIOT-TOKEN': key,
    }
  })
}

const getSummonerRank = async (id) => {
  let url = `https://na1.api.riotgames.com/tft/league/v1/entries/by-summoner/${id}`;
  return await axios({
    method: 'get',
    url,
    headers: {
      'X-RIOT-TOKEN': key,
    }
  })
}

router.get('/', async (req, res) => {
  await Summoner.sync();
  const summoner = await Summoner.findOne({ where: {name: req.query.name} });
  if(!summoner){
    try {
      const response = await lookUpSummoner(req.query.name);
      const rankResponse = await getSummonerRank(response.data.id);
      const data = {...rankResponse.data[0], ...response.data}
      res.send(data);
      Summoner.create(data);
    } catch(error) {
      res.send(error);
    };
  } else {
    res.send(summoner.dataValues);
  }
});

module.exports = router;
