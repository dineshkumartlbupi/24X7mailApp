class ShipmentModel {
  ShipmentModel({
    bool? status,
    String? msg,
    Data? data,
  }) {
    _status = status;
    _msg = msg;
    _data = data;
  }

  ShipmentModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _msg;
  Data? _data;
  ShipmentModel copyWith({
    bool? status,
    String? msg,
    Data? data,
  }) =>
      ShipmentModel(
        status: status ?? _status,
        msg: msg ?? _msg,
        data: data ?? _data,
      );
  bool? get status => _status;
  String? get msg => _msg;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    String? user,
    String? name,
    String? company,
    String? address1,
    String? address2,
    Country? country,
    City? city,
    State? state,
    int? postalCode,
    int? phone,
    String? id,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _user = user;
    _name = name;
    _company = company;
    _address1 = address1;
    _address2 = address2;
    _country = country;
    _city = city;
    _state = state;
    _postalCode = postalCode;
    _phone = phone;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _user = json['user'];
    _name = json['name'];
    _company = json['company'];
    _address1 = json['address1'];
    _address2 = json['address2'];
    _country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _state = json['state'] != null ? State.fromJson(json['state']) : null;
    _postalCode = json['postal_code'];
    _phone = json['phone'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _user;
  String? _name;
  String? _company;
  String? _address1;
  String? _address2;
  Country? _country;
  City? _city;
  State? _state;
  int? _postalCode;
  int? _phone;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  Data copyWith({
    String? user,
    String? name,
    String? company,
    String? address1,
    String? address2,
    Country? country,
    City? city,
    State? state,
    int? postalCode,
    int? phone,
    String? id,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      Data(
        user: user ?? _user,
        name: name ?? _name,
        company: company ?? _company,
        address1: address1 ?? _address1,
        address2: address2 ?? _address2,
        country: country ?? _country,
        city: city ?? _city,
        state: state ?? _state,
        postalCode: postalCode ?? _postalCode,
        phone: phone ?? _phone,
        id: id ?? _id,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  String? get user => _user;
  String? get name => _name;
  String? get company => _company;
  String? get address1 => _address1;
  String? get address2 => _address2;
  Country? get country => _country;
  City? get city => _city;
  State? get state => _state;
  int? get postalCode => _postalCode;
  int? get phone => _phone;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = _user;
    map['name'] = _name;
    map['company'] = _company;
    map['address1'] = _address1;
    map['address2'] = _address2;
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    if (_state != null) {
      map['state'] = _state?.toJson();
    }
    map['postal_code'] = _postalCode;
    map['phone'] = _phone;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
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
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _name = json['name'];
  }
  int? _countryId;
  int? _stateId;
  String? _name;
  State copyWith({
    int? countryId,
    int? stateId,
    String? name,
  }) =>
      State(
        countryId: countryId ?? _countryId,
        stateId: stateId ?? _stateId,
        name: name ?? _name,
      );
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
    _cityId = json['city_id'];
    _stateId = json['state_id'];
    _name = json['name'];
  }
  int? _cityId;
  int? _stateId;
  String? _name;
  City copyWith({
    int? cityId,
    int? stateId,
    String? name,
  }) =>
      City(
        cityId: cityId ?? _cityId,
        stateId: stateId ?? _stateId,
        name: name ?? _name,
      );
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

class Country {
  Country({
    int? countryId,
    String? name,
  }) {
    _countryId = countryId;
    _name = name;
  }

  Country.fromJson(dynamic json) {
    _countryId = json['country_id'];
    _name = json['name'];
  }
  int? _countryId;
  String? _name;
  Country copyWith({
    int? countryId,
    String? name,
  }) =>
      Country(
        countryId: countryId ?? _countryId,
        name: name ?? _name,
      );
  int? get countryId => _countryId;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = _countryId;
    map['name'] = _name;
    return map;
  }
}
