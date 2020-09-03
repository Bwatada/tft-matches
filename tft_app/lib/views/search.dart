import 'package:flutter/material.dart';
import 'package:tft_app/widgets/textForm.dart';

class TftSearch extends StatefulWidget {
  TftSearch({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TftSearchState createState() => _TftSearchState();
}

class _TftSearchState extends State<TftSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tft Matches',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            Image(
                height: 128,
                image: NetworkImage(
                    'https://cdn.escharts.com/uploads/public/5d2/355/0d1/5d23550d15183441256444.png')),
            TftSearchForm(),
          ],
        ));
  }
}
