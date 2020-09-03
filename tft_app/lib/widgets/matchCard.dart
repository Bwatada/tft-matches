import 'package:flutter/material.dart';
import 'package:tft_app/models/match.dart';

class MatchCard extends StatefulWidget {
  final Match match;

  MatchCard(this.match);

  @override
  _MatchCardState createState() => _MatchCardState(match);
}

class _MatchCardState extends State<MatchCard> {
  Match match;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Column(
          children: [
            Container(
              height: 100,
              child: Image.network(
                  'https://cdn.communitydragon.org/10.16.1/profile-icon/4660'),
            )
          ],
        ),
        Column(
          children: [Text('6th Place'), Text('Normal')],
        ),
        Image.network(
            'http://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/assets/ux/traiticons/trait_icon_3_sniper.png'),
        Image.network(
            'http://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/assets/ux/traiticons/trait_icon_3_sniper.png'),
        Image.network(
            'http://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/assets/ux/traiticons/trait_icon_3_sniper.png')
      ],
    ));
  }

  _MatchCardState(this.match);
}
