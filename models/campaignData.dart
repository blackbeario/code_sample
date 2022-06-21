class CampaignData {
  String? id;
  String? name;
  String? gameTypeKey;
  String? tier;
  bool? active;
  int? commercial15;
  int? commercial30;
  int? replayBumper;
  int? stadiumBanner;
  int? mobileBanner;
  int? takeoverBanner;
  int? replayBumperWithBug;
  int? indoorBanner;
  int? scoreTableBanner;
  int? bugs;

  CampaignData({
    this.active,
    this.id,
    this.name,
    this.gameTypeKey,
    this.tier,
    this.commercial15,
    this.commercial30,
    this.replayBumper,
    this.stadiumBanner,
    this.mobileBanner,
    this.takeoverBanner,
    this.replayBumperWithBug,
    this.indoorBanner,
    this.scoreTableBanner,
    this.bugs,
  });

  CampaignData.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    id = json['id'];
    name = json['name'];
    gameTypeKey = json['gameTypeKey'];
    tier = json['tier'];
    commercial15 = json['contractAllocated']['stadiumVideo15Second'];
    commercial30 = json['contractAllocated']['stadiumVideo30Second'];
    replayBumper = json['contractAllocated']['stadiumVideoReplayBumper'];
    replayBumperWithBug = json['contractAllocated']['stadiumVideoReplayBumperBugs'];
    stadiumBanner = json['contractAllocated']['stadiumBannerAds'];
    mobileBanner = json['contractAllocated']['mobileCompanionAds'];
    indoorBanner = json['contractAllocated']['indoorBannerAds'];
    scoreTableBanner = json['contractAllocated']['indoorScoreTableBanners'];
    takeoverBanner = json['contractAllocated']['stadiumOverlayTakeover'];
    bugs = json['contractAllocated']['stadiumOverlayLogoBug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contractAllocated']['stadiumVideo15Second'] = this.commercial15;
    data['contractAllocated']['stadiumVideo30Second'] = this.commercial30;
    data['contractAllocated']['stadiumVideoReplayBumper'] = this.replayBumper;
    data['contractAllocated']['stadiumVideoReplayBumperBugs'] = this.replayBumperWithBug;
    data['contractAllocated']['stadiumBannerAds'] = this.stadiumBanner;
    data['contractAllocated']['mobileCompanionAds'] = this.mobileBanner;
    data['contractAllocated']['indoorBannerAds'] = this.indoorBanner;
    data['contractAllocated']['indoorScoreTableBanners'] = this.scoreTableBanner;
    data['contractAllocated']['stadiumOverlayTakeover'] = this.takeoverBanner;
    data['contractAllocated']['stadiumOverlayLogoBug'] = this.bugs;
    return data;
  }
}
