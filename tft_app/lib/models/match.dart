class Match {
  final SumInfo summonerInfo;
  final int gameDatetime;
  final String gameVariation;
  final String gameVersion;
  final List<SumInfo> participants;
  final int queueId;
  final int tftSetNumber;

  Match(
      {this.summonerInfo,
      this.gameDatetime,
      this.gameVariation,
      this.gameVersion,
      this.participants,
      this.queueId,
      this.tftSetNumber});

  factory Match.fromJson(Map<String, dynamic> json) {
    List<SumInfo> p = [];
    json['participants']
        .forEach((participant) => p.add(SumInfo.fromJson(participant)));
    return Match(
        summonerInfo: SumInfo.fromJson(json['summoner_info']),
        gameDatetime: json['game_datetime'],
        gameVariation: json['game_variation'],
        gameVersion: json['game_version'],
        participants: p,
        queueId: json['queue_id'],
        tftSetNumber: json['tft_set_number']);
  }
}

class SumInfo {
  final CompanionInfo companion;
  final int goldLeft;
  final int lastRound;
  final int level;
  final int placement;
  final int playersEliminated;
  final String puuid;
  final double timeEliminated;
  final int totalDmgToPlayers;
  final List<TraitInfo> traits;
  final List<UnitInfo> units;

  SumInfo(
      {this.companion,
      this.goldLeft,
      this.lastRound,
      this.level,
      this.placement,
      this.playersEliminated,
      this.puuid,
      this.timeEliminated,
      this.totalDmgToPlayers,
      this.traits,
      this.units});

  factory SumInfo.fromJson(Map<String, dynamic> json) {
    List<TraitInfo> t = [];
    json['traits'].forEach((trait) => t.add(TraitInfo.fromJson(trait)));
    return SumInfo(
        companion: CompanionInfo.fromJson(json['companion']),
        goldLeft: json['gold_left'],
        lastRound: json['last_round'],
        level: json['level'],
        placement: json['placement'],
        playersEliminated: json['players_eliminated'],
        puuid: json['puuid'],
        timeEliminated: json['time_eliminated'],
        totalDmgToPlayers: json['total_damage_to_players'],
        traits: t);
  }
}

class CompanionInfo {
  final String contentId;
  final int skinId;
  final String species;

  CompanionInfo({this.contentId, this.skinId, this.species});
  factory CompanionInfo.fromJson(Map<String, dynamic> json) {
    return CompanionInfo(
        contentId: json['content_ID'],
        skinId: json['skinID'],
        species: json['species']);
  }
}

class TraitInfo {
  final String name;
  final int numUnits;
  final int style;
  final int tierCurrent;
  final int tierTotal;

  TraitInfo(
      {this.name, this.numUnits, this.style, this.tierCurrent, this.tierTotal});
  factory TraitInfo.fromJson(Map<String, dynamic> json) {
    return TraitInfo(
        name: json['name'],
        numUnits: json['num_units'],
        style: json['style'],
        tierCurrent: json['tier_current'],
        tierTotal: json['tier_total']);
  }
}

class UnitInfo {
  final String characterId;
  final List<int> items;
  final String name;
  final int rarity;
  final int tier;

  UnitInfo({this.characterId, this.items, this.name, this.rarity, this.tier});

  factory UnitInfo.fromJson(Map<String, dynamic> json) {
    return UnitInfo(
        characterId: json['character_id'],
        items: json['items'],
        name: json['name'],
        rarity: json['rarity'],
        tier: json['tier']);
  }
}
