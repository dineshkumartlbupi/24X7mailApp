class OperatorModel {
  OperatorModel({
    bool? status,
    String? msg,
    List<Data>? data,
    int? total,
  }) {
    _status = status;
    _msg = msg;
    _data = data;
    _total = total;
  }

  OperatorModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _total = json['total'];
  }
  bool? _status;
  String? _msg;
  List<Data>? _data;
  int? _total;
  OperatorModel copyWith({
    bool? status,
    String? msg,
    List<Data>? data,
    int? total,
  }) =>
      OperatorModel(
        status: status ?? _status,
        msg: msg ?? _msg,
        data: data ?? _data,
        total: total ?? _total,
      );
  bool? get status => _status;
  String? get msg => _msg;
  List<Data>? get data => _data;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    return map;
  }
}

class Data {
  Data({
    City? city,
    State? state,
    Country? country,
    String? id,
    String? businessName,
    String? fName,
    String? lName,
    dynamic appartmentNo,
    String? businessAddress,
    String? userStatus,
    String? userType,
    String? zipCode,
    int? phone,
    String? email,
    String? password,
    int? storeId,
    String? approveStatus,
    dynamic remark,
    bool? isDeleted,
    List<dynamic>? range,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _city = city;
    _state = state;
    _country = country;
    _id = id;
    _businessName = businessName;
    _fName = fName;
    _lName = lName;
    _appartmentNo = appartmentNo;
    _businessAddress = businessAddress;
    _userStatus = userStatus;
    _userType = userType;
    _zipCode = zipCode;
    _phone = phone;
    _email = email;
    _password = password;
    _storeId = storeId;
    _approveStatus = approveStatus;
    _remark = remark;
    _isDeleted = isDeleted;
    _range = range;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _state = json['state'] != null ? State.fromJson(json['state']) : null;
    _country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    _id = json['_id'];
    _businessName = json['business_name'];
    _fName = json['f_name'];
    _lName = json['l_name'];
    _appartmentNo = json['appartment_no'];
    _businessAddress = json['business_address'];
    _userStatus = json['user_status'];
    _userType = json['user_type'];
    _zipCode = json['zip_code'];
    _phone = json['phone'];
    _email = json['email'];
    _password = json['password'];
    _storeId = json['store_id'];
    _approveStatus = json['approve_status'];
    _remark = json['remark'];
    _isDeleted = json['isDeleted'];
    if (json['range'] != null) {
      _range = [];
      json['range'].forEach((v) {
        _range?.add(fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  City? _city;
  State? _state;
  Country? _country;
  String? _id;
  String? _businessName;
  String? _fName;
  String? _lName;
  dynamic _appartmentNo;
  String? _businessAddress;
  String? _userStatus;
  String? _userType;
  String? _zipCode;
  int? _phone;
  String? _email;
  String? _password;
  int? _storeId;
  String? _approveStatus;
  dynamic _remark;
  bool? _isDeleted;
  List<dynamic>? _range;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  Data copyWith({
    City? city,
    State? state,
    Country? country,
    String? id,
    String? businessName,
    String? fName,
    String? lName,
    dynamic appartmentNo,
    String? businessAddress,
    String? userStatus,
    String? userType,
    String? zipCode,
    int? phone,
    String? email,
    String? password,
    int? storeId,
    String? approveStatus,
    dynamic remark,
    bool? isDeleted,
    List<dynamic>? range,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      Data(
        city: city ?? _city,
        state: state ?? _state,
        country: country ?? _country,
        id: id ?? _id,
        businessName: businessName ?? _businessName,
        fName: fName ?? _fName,
        lName: lName ?? _lName,
        appartmentNo: appartmentNo ?? _appartmentNo,
        businessAddress: businessAddress ?? _businessAddress,
        userStatus: userStatus ?? _userStatus,
        userType: userType ?? _userType,
        zipCode: zipCode ?? _zipCode,
        phone: phone ?? _phone,
        email: email ?? _email,
        password: password ?? _password,
        storeId: storeId ?? _storeId,
        approveStatus: approveStatus ?? _approveStatus,
        remark: remark ?? _remark,
        isDeleted: isDeleted ?? _isDeleted,
        range: range ?? _range,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  City? get city => _city;
  State? get state => _state;
  Country? get country => _country;
  String? get id => _id;
  String? get businessName => _businessName;
  String? get fName => _fName;
  String? get lName => _lName;
  dynamic get appartmentNo => _appartmentNo;
  String? get businessAddress => _businessAddress;
  String? get userStatus => _userStatus;
  String? get userType => _userType;
  String? get zipCode => _zipCode;
  int? get phone => _phone;
  String? get email => _email;
  String? get password => _password;
  int? get storeId => _storeId;
  String? get approveStatus => _approveStatus;
  dynamic get remark => _remark;
  bool? get isDeleted => _isDeleted;
  List<dynamic>? get range => _range;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    if (_state != null) {
      map['state'] = _state?.toJson();
    }
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    map['_id'] = _id;
    map['business_name'] = _businessName;
    map['f_name'] = _fName;
    map['l_name'] = _lName;
    map['appartment_no'] = _appartmentNo;
    map['business_address'] = _businessAddress;
    map['user_status'] = _userStatus;
    map['user_type'] = _userType;
    map['zip_code'] = _zipCode;
    map['phone'] = _phone;
    map['email'] = _email;
    map['password'] = _password;
    map['store_id'] = _storeId;
    map['approve_status'] = _approveStatus;
    map['remark'] = _remark;
    map['isDeleted'] = _isDeleted;
    if (_range != null) {
      map['range'] = _range?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

  fromJson(v) {}
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

class State {
  State({
    int? stateId,
    int? countryId,
    String? name,
  }) {
    _stateId = stateId;
    _countryId = countryId;
    _name = name;
  }

  State.fromJson(dynamic json) {
    _stateId = json['state_id'];
    _countryId = json['country_id'];
    _name = json['name'];
  }
  int? _stateId;
  int? _countryId;
  String? _name;
  State copyWith({
    int? stateId,
    int? countryId,
    String? name,
  }) =>
      State(
        stateId: stateId ?? _stateId,
        countryId: countryId ?? _countryId,
        name: name ?? _name,
      );
  int? get stateId => _stateId;
  int? get countryId => _countryId;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state_id'] = _stateId;
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
