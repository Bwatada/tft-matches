const Sequelize = require('sequelize');
const { search } = require('../app');

const sequelize = new Sequelize('tftSQL', 'root', 'zxcdsa1998', {
    host: 'localhost',
    dialect: 'mysql'
  });

const Summoner = sequelize.define('summoners', {
    /*
        profileIconId	int	ID of the summoner icon associated with the summoner.
        name	string	Summoner name.
        puuid	string	Encrypted PUUID. Exact length of 78 characters.
        summonerLevel	long	Summoner level associated with the summoner.
        revisionDate	long	Date summoner was last modified specified as epoch milliseconds. The following events will update this timestamp: profile icon change, playing the tutorial or advanced tutorial, finishing a game, summoner name change
        id	string	Encrypted summoner ID. Max length 63 characters.
        accountId	string	Encrypted account ID. Max length 56 characters.
    */
    // attributes
    profileIconId: {
      type: Sequelize.INTEGER,
    },
    name: {
      type: Sequelize.STRING
    },
    puuid: {
        type: Sequelize.STRING,
        allowNull: false,
        primaryKey: true,
    },
    summonerLevel: {
        type: Sequelize.BIGINT
    },
    revisionDate: {
        type: Sequelize.BIGINT,
    },
    id: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    accountId: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    tier: {
      type: Sequelize.STRING,
      allowNull: true,    
    },
    rank: {
      type: Sequelize.STRING,
      allowNull: true,
    },
    wins: {
      type: Sequelize.INTEGER,
      allowNull: true,
    },
    losses: {
      type: Sequelize.INTEGER,
      allowNull: true,
    },
    leaguePoints: {
      type: Sequelize.INTEGER,
      allowNull: true
    }
  }, {
    // options
    sequelize,
    modelName: 'summoners'
  });

  module.exports = Summoner;