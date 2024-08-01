class ShipmentModel {
  ShipmentModel({
    bool? status,
    String? msg,
    List<Data>? data,
  }) {
    _status = status;
    _msg = msg;
    _data = data;
  }

  ShipmentModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  bool? _status;
  String? _msg;
  List<Data>? _data;

  bool? get status => _status;
  String? get msg => _msg;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    Country? country,
    City? city,
    State? state,
    String? id,
    String? user,
    String? name,
    String? company,
    String? address1,
    String? address2,
    int? postalCode,
    int? phone,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _country = country;
    _city = city;
    _state = state;
    _id = id;
    _user = user;
    _name = name;
    _company = company;
    _address1 = address1;
    _address2 = address2;
    _postalCode = postalCode;
    _phone = phone;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _state = json['state'] != null ? State.fromJson(json['state']) : null;
    _id = json['_id'];
    _user = json['user'];
    _name = json['name'];
    _company = json['company'];
    _address1 = json['address1'];
    _address2 = json['address2'];
    _postalCode = json['postal_code'] is String
        ? int.tryParse(json['postal_code'])
        : json['postal_code'];
    _phone =
        json['phone'] is String ? int.tryParse(json['phone']) : json['phone'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'] is String ? int.tryParse(json['__v']) : json['__v'];
  }

  Country? _country;
  City? _city;
  State? _state;
  String? _id;
  String? _user;
  String? _name;
  String? _company;
  String? _address1;
  String? _address2;
  int? _postalCode;
  int? _phone;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  Country? get country => _country;
  City? get city => _city;
  State? get state => _state;
  String? get id => _id;
  String? get user => _user;
  String? get name => _name;
  String? get company => _company;
  String? get address1 => _address1;
  String? get address2 => _address2;
  int? get postalCode => _postalCode;
  int? get phone => _phone;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    if (_state != null) {
      map['state'] = _state?.toJson();
    }
    map['_id'] = _id;
    map['user'] = _user;
    map['name'] = _name;
    map['company'] = _company;
    map['address1'] = _address1;
    map['address2'] = _address2;
    map['postal_code'] = _postalCode;
    map['phone'] = _phone;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}

class Country {
  Country({
    int? countryId,
    String? name,
  }) {
    _countryId = countryId;
    _name = name;
  }

  Country.fromJson(dynamic json) {
    _countryId = json['country_id'] is String
        ? int.tryParse(json['country_id'])
        : json['country_id'];
    _name = json['name'];
  }

  int? _countryId;
  String? _name;

  int? get countryId => _countryId;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = _countryId;
    map['name'] = _name;
    return map;
  }
}

class City {
  City({
    int? cityId,
    int? stateId,
    String? name,
  }) {
    _cityId = cityId;
    _stateId = stateId;
    _name = name;
  }

  City.fromJson(dynamic json) {
    _cityId = json['city_id'] is String
        ? int.tryParse(json['city_id'])
        : json['city_id'];
    _stateId = json['state_id'] is String
        ? int.tryParse(json['state_id'])
        : json['state_id'];
    _name = json['name'];
  }

  int? _cityId;
  int? _stateId;
  String? _name;

  int? get cityId => _cityId;
  int? get stateId => _stateId;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city_id'] = _cityId;
    map['state_id'] = _stateId;
    map['name'] = _name;
    return map;
  }
}

class State {
  State({
    int? countryId,
    int? stateId,
    String? name,
  }) {
    _countryId = countryId;
    _stateId = stateId;
    _name = name;
  }

  State.fromJson(dynamic json) {
    _countryId = json['country_id'] is String
        ? int.tryParse(json['country_id'])
        : json['country_id'];
    _stateId = json['state_id'] is String
        ? int.tryParse(json['state_id'])
        : json['state_id'];
    _name = json['name'];
  }

  int? _countryId;
  int? _stateId;
  String? _name;

  int? get countryId => _countryId;
  int? get stateId => _stateId;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = _countryId;
    map['state_id'] = _stateId;
    map['name'] = _name;
    return map;
  }
}
