var express = require('express');
var router = express.Router();
const axios = require('axios');

const Summoner = require('../models/summoner');
const key = require('../constants/constants').api;

const lookUpSummoner = async (name) => {
  let url = 'https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/' + name.split(' ').join("%20"); 
  return axios({
    method: 'get',
    url,
    headers: {
      'X-RIOT-TOKEN': key,
    }
  })
  
}
/* GET by summoner name. */

router.get('/', function(req, res) {
  Summoner.sync()
  .then(() => {
    Summoner.findOne({ where: {name: req.query.name} }).then(summoner => {
      // project will be the first entry of the Projects table with the title 'aProject' || null
      if(!summoner){
        lookUpSummoner(req.query.name)
        .then(response => {
          res.send(response.data);
          Summoner.create({...response.data});
        })
        .catch(error => {
          res.send(error);
        });
      } else {
        res.send(summoner.dataValues);
      }
    });
  })
  .catch(error => {
    res.send(error);
  });
});

module.exports = router;
