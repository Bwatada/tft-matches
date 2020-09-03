import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:tft_app/state/appState.dart';
import 'package:provider/provider.dart';
import 'package:tft_app/models/summoner.dart';
import 'dart:convert';
import 'package:tft_app/views/profile.dart';

// Define a custom Form widget.
class TftSearchForm extends StatefulWidget {
  @override
  _TftSearchFormState createState() => _TftSearchFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _TftSearchFormState extends State<TftSearchForm> {
  Future searchSummoner() async {
    var state = context.read<StateModel>();
    var url = 'http://f033ac249849.ngrok.io/summoner/?name=' + state.text;
    var response;
    try {
      response = await get(url);
    } catch (e) {
      print(e);
    }
    var s = Summoner.fromJson(json.decode(response.body));
    state.updateSummoner(s);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    var state = context.read<StateModel>();
    state.clearText();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = context.watch<StateModel>();
    return Container(
        child: Row(children: [
      Expanded(
          child: TextField(
        decoration: InputDecoration(hintText: 'Search for summoner'),
        onChanged: (t) {
          state.updateText(t);
        },
      )),
      IconButton(
        icon: Icon(Icons.check_circle),
        onPressed: () async {
          await searchSummoner();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        },
      )
    ]));
  }
}
