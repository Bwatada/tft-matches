import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tft_app/widgets/matchCard.dart';
import 'package:tft_app/state/appState.dart';
import 'package:provider/provider.dart';
import 'package:tft_app/models/match.dart';

class MatchList extends StatefulWidget {
  MatchList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  Future getMatches() async {
    var state = context.read<StateModel>();

    var url =
        'http://f033ac249849.ngrok.io/matches/?puuid=${state.summoner.puuid}';
    var response;
    try {
      response = await get(url);
    } catch (e) {
      print(e);
    }
    List<MatchCard> matches = [];
    await Future.forEach(json.decode(response.body), (match) async {
      matches.add(await getMatch(match, state.summoner.puuid));
    });
    print('done');
    state.updateMatches(matches);
  }

  Future getMatch(mid, puuid) async {
    var url =
        'http://f033ac249849.ngrok.io/matches/match/?mid=$mid&puuid=$puuid';
    var response;
    try {
      response = await get(url);
    } catch (e) {
      print(e);
    }
    return MatchCard(Match.fromJson(json.decode(response.body)));
  }

  @override
  Widget build(BuildContext context) {
    var state = context.watch<StateModel>();
    var children = state.matches;
    if (children.length <= 0) {
      return IconButton(
          icon: Icon(Icons.loop),
          onPressed: () async {
            await getMatches();
          });
    } else {
      return ListView(children: children);
    }
  }
}
