class Advertisement {
  String? adServiceContractId;
  AdServiceMarket? market;
  List<MarketArea>? marketAreas;
  String? adTypeKey;
  int? adPlaysTotal;
  int? adPlayImpressionsTotal;
  String? clubId;
  String? clubName;
  List<AdvertiserContent>? content;
  double? durationSeconds;
  String? id;
  String? name;
  String? scheduleStartDate;
  String? scheduleEndDate;
  String? schoolWorkflowStatus;
  List<String>? segments;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Advertisement({
    this.adServiceContractId,
    this.market,
    this.marketAreas,
    this.adTypeKey,
    this.adPlaysTotal,
    this.adPlayImpressionsTotal,
    this.clubId,
    this.clubName,
    this.content,
    this.durationSeconds,
    this.id,
    this.name,
    this.scheduleStartDate,
    this.scheduleEndDate,
    this.schoolWorkflowStatus,
    this.segments,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Advertisement.fromJson(Map<String, dynamic> json) {
    adServiceContractId = json['adServiceContractId'];
    if (json['marketAreas'] != null) {
      marketAreas = [];
      if (json['marketAreas']['items'].length > 0) {
        if (json['marketAreas']['items'][0]['adServiceMarket'] != null)
          market = AdServiceMarket.fromGetAdvertisement(json['marketAreas']['items'][0]['adServiceMarket']);
      }
      json['marketAreas']['items'].forEach((v) {
        if (v != null && v['adServiceMarketArea'] != null) {
          marketAreas?.add(MarketArea.fromJson(v['adServiceMarketArea']));
        }
      });
    }
    adTypeKey = json['adTypeKey'];
    adPlaysTotal = json['adPlaysTotal'];
    adPlayImpressionsTotal = json['adPlayImpressionsTotal'];
    clubId = json['clubId'];
    clubName = json['clubName'];
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        if (v != null && v["advertiserContent"] != null) content?.add(AdvertiserContent.fromJson(v["advertiserContent"]));
      });
    }
    if (json['durationSeconds'].runtimeType == int)
      durationSeconds = json['durationSeconds'].toDouble();
    else
      durationSeconds = json['durationSeconds'];
    id = json['id'];
    name = json['name'];
    scheduleStartDate = json['scheduleStartDate'];
    scheduleEndDate = json['scheduleEndDate'];
    schoolWorkflowStatus = json['schoolWorkflowStatus'];
    if (json['segments'] != null) {
      segments = [];
      json['segments'].forEach((value) => segments?.add(value));
    }
    status = json['status'];
    createdAt = DateTime.tryParse(json['createdAt']);
    updatedAt = DateTime.tryParse(json['updatedAt']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adServiceContractId'] = this.adServiceContractId;
    // if (this.adServiceMarket != null) {
    //   data['adServiceMarket'] = this.adServiceMarket!.toJson();
    // }
    data['adTypeKey'] = this.adTypeKey;
    data['adPlaysTotal'] = this.adPlaysTotal;
    data['adPlayImpressionsTotal'] = this.adPlayImpressionsTotal;
    data['clubId'] = this.clubId;
    data['clubName'] = this.clubName;
    if (this.content != null) {
      data['content'] = this.content?.map((v) => v.toJson()).toList();
    }
    data['durationSeconds'] = this.durationSeconds;
    data['id'] = this.id;
    data['name'] = this.name;
    data['scheduleStartDate'] = this.scheduleStartDate;
    data['scheduleEndDate'] = this.scheduleEndDate;
    data['schoolWorkflowStatus'] = this.schoolWorkflowStatus;
    data['segments'] = this.segments;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class AdServiceMarket {
  String? id;
  String? name;
  String? description;
  List<MarketArea>? marketAreas;

  AdServiceMarket({this.id, this.name, this.description, this.marketAreas});

  AdServiceMarket.empty() {
    id = '';
    name = '';
    description = '';
    marketAreas = null;
  }

  AdServiceMarket.fromGetAdvertisement(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  AdServiceMarket.fromListAdServiceMarkets(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['marketAreas'] != null) marketAreas = [];
    if (json['marketAreas']['items'] != null) {
      json['marketAreas']['items'].forEach((v) {
        marketAreas?.add(MarketArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.marketAreas != null) {
      data['marketAreas'] = this.marketAreas!.map((market) => market.toJson());
    }
    return data;
  }
}

class MarketArea {
  String? id;
  String? name;
  String? description;
  String? schoolId;
  String? areaType;
  String? eventId;
  String? eventRegionId;
  String? eventLocationId;

  MarketArea({this.id, this.name, this.description, this.schoolId, this.areaType, this.eventId, this.eventRegionId, this.eventLocationId});

  MarketArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    schoolId = json['schoolId'];
    areaType = json['areaType'];
    eventId = json['eventId'];
    eventRegionId = json['eventRegionId'];
    eventLocationId = json['eventLocationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['schoolId'] = this.schoolId;
    data['areaType'] = this.areaType;
    data['eventId'] = this.eventId;
    data['eventRegionId'] = this.eventRegionId;
    data['eventLocationId'] = this.eventLocationId;
    return data;
  }
}

class AdvertiserContent {
  String? id;
  String? originalUrl;
  String? thumbnailSmUrl;

  AdvertiserContent({this.id, this.originalUrl, this.thumbnailSmUrl});

  AdvertiserContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalUrl = json['originalUrl'];
    thumbnailSmUrl = json['thumbnailSmUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['originalUrl'] = this.originalUrl;
    data['thumbnailSmUrl'] = this.thumbnailSmUrl;
    return data;
  }
}
