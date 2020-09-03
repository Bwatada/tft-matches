import 'package:flutter/material.dart';
import 'package:tft_app/state/appState.dart';
import 'package:provider/provider.dart';
import 'package:tft_app/constants/constants.dart';

class SummonerCard extends StatefulWidget {
  @override
  _SummonerCardState createState() => _SummonerCardState();
}

class _SummonerCardState extends State<SummonerCard> {

  @override
  Widget build(BuildContext context) {
    var state = context.watch<StateModel>();
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(children: [
              Image.network(
                'http://ddragon.leagueoflegends.com/cdn/10.16.1/img/profileicon/${state.summoner.profileIconId}.png',
                height: 100,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(children: [
                    Text(state.summoner.name),
                    Text('Level: ${state.summoner.summonerLevel}'),
                    tiers[state.summoner.tier] != null
                        ? Text(
                            'Rank: ${state.summoner.tier} ${state.summoner.rank} ${state.summoner.leaguePoints} LP')
                        : Text('Summoner not ranked'),
                    Row(
                      children: [
                        if (tiers[state.summoner.tier] != null)
                          Image.network(
                            'https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-league-tier-names/global/default/assets/images/ranked-mini-regalia/${tiers[state.summoner.tier]}.png',
                            height: 50,
                          ),
                      ],
                    )
                  ])),
            ])));
  }
}
