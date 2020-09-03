var express = require('express');
var router = express.Router();
const axios = require('axios');

const key = require('../constants/constants').api;
const testID = require('../constants/constants').testPUUID;

const getMatch = async (id) => {
    let url = 'https://americas.api.riotgames.com/tft/match/v1/matches/' + id; 
    axios({
        method: 'get',
        url,
        headers: {
        'X-RIOT-TOKEN': key,
        }
    })
    .then(response => {
        return response.data;
    })
    .catch(error => {
        res.send(error);
    });
}

/* GET list of matches by summoner name. */

router.get('/', function(req, res, next) {
    let id = req.query.puuid || testID;
    let url = 'https://americas.api.riotgames.com/tft/match/v1/matches/by-puuid/' + id + '/ids?count=10'; 
    axios({
        method: 'get',
        url,
        headers: {
        'X-RIOT-TOKEN': key,
        }
    })
    .then(response => {
        let out = [];
        response.data.forEach(match => {
            out.push(getMatch(match));
        })
        res.send(response.data);
    })
    .catch(error => {
        res.send(error);
    });
});

router.get('/match', function(req, res, next) {
    const url = 'https://americas.api.riotgames.com/tft/match/v1/matches/' + req.query.mid; 
    const id = req.query.puuid || testID;
    axios({
        method: 'get',
        url,
        headers: {
        'X-RIOT-TOKEN': key,
        }
    })
    .then(response => {
        res.send({
            summoner_info: response.data.info.participants.find(participant => participant.puuid = id),
            matchId: response.data.metadata.matchId,
            ...response.data.info
        });
    })
    .catch(error => {
        res.send(error);
    });
})
module.exports = router;