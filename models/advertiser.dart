class Advertiser {
  String? id;
  String? name;
  List<AdvertiserSetting>? settings;

  Advertiser({
    this.id,
    this.name,
    this.settings,
  });

  Advertiser.initial({
    id = '',
    name = '',
    settings = null,
  });

  _convertSettings(settingsList) {
    List<AdvertiserSetting> advertiserSettings = [];
    for (var setting in settingsList) {
      advertiserSettings.add(AdvertiserSetting.fromJson(setting));
    }
    return advertiserSettings;
  }

  Advertiser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    settings = _convertSettings(json['settings']['items']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class AdvertiserSetting {
  String? id;
  String? key;
  String? value;

  AdvertiserSetting.empty() {
    id = '';
    key = '';
    value = '';
  }

  AdvertiserSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }
}
