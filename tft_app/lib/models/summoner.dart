class Summoner {
  final int profileIconId;
  final String name;
  final String puuid;
  final int summonerLevel;
  final int revisionDate;
  final String id;
  final String accountId;
  final String tier;
  final String rank;
  final int wins;
  final int losses;
  final int leaguePoints;
  Summoner(
      {this.profileIconId,
      this.name,
      this.puuid,
      this.summonerLevel,
      this.revisionDate,
      this.id,
      this.accountId,
      this.tier,
      this.rank,
      this.wins,
      this.losses,
      this.leaguePoints});

  factory Summoner.fromJson(Map<String, dynamic> json) {
    return Summoner(
        profileIconId: json['profileIconId'],
        name: json['name'],
        puuid: json['puuid'],
        summonerLevel: json['summonerLevel'],
        revisionDate: json['revisionDate'],
        id: json['id'],
        accountId: json['accountId'],
        tier: json['tier'],
        rank: json['rank'],
        wins: json['wins'],
        losses: json['losses'],
        leaguePoints: json['leaguePoints']);
  }
}
