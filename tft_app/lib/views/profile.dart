import 'package:flutter/material.dart';
import 'package:tft_app/widgets/summonerCard.dart';
import 'package:tft_app/widgets/matchList.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            tooltip: 'search for a new summoner',
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      Container(
        child: SummonerCard(),
        height: 100,
      ),
      Expanded(
        child: MatchList(),
      )
    ]));
  }
}
