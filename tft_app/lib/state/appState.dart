import 'package:flutter/material.dart';
import 'package:tft_app/models/summoner.dart';
import 'package:tft_app/widgets/matchCard.dart';

class StateModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  String _text = '';
  Summoner _summoner;
  List _matches = [];

  List get matches => _matches;
  String get text => _text;
  Summoner get summoner => _summoner;

  void updateMatches(List<MatchCard> m) {
    _matches = m;
    notifyListeners();
  }

  void clearMatches() {
    _matches = [];
    notifyListeners();
  }

  void updateSummoner(Summoner s) {
    _summoner = s;
    notifyListeners();
  }

  void clearSummoner() {
    _summoner = null;
    notifyListeners();
  }

  void updateText(String t) {
    _text = t;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void clearText() {
    _text = '';
  }

  void removeAll() {
    _text = '';
    _summoner = null;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
