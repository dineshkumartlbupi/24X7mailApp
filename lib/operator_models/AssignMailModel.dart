import '../models/customerMailModel.dart';

class AssignMailModel {
  AssignMailModel({
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

  AssignMailModel.fromJson(dynamic json) {
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
  AssignMailModel copyWith({
    bool? status,
    String? msg,
    List<Data>? data,
    int? total,
  }) =>
      AssignMailModel(
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
    String? id,
    Operator? operator,
    String? mailBoxId,
    String? mailType,
    String? mailStatus,
    int? shered,
    bool? shipped,
    dynamic deleteAt,
    bool? returned,
    dynamic description,
    List<Measurement>? measurement,
    String? createdAt,
    String? updatedAt,
    int? v,
    List<dynamic>? assign,
    List<MailHistory>? mailHistory,
    String? idAS,
  }) {
    _id = id;
    _operator = operator;
    _mailBoxId = mailBoxId;
    _mailType = mailType;
    _mailStatus = mailStatus;
    _shered = shered;
    _shipped = shipped;
    _deleteAt = deleteAt;
    _returned = returned;
    _description = description;
    _measurement = measurement;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _assign = assign;
    _mailHistory = mailHistory;
    _id = id;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _operator =
        json['operator'] != null ? Operator.fromJson(json['operator']) : null;
    _mailBoxId = json['mail_box_id'];
    _mailType = json['mail_type'];
    _mailStatus = json['mail_status'];
    _shered = json['shered'];
    _shipped = json['shipped'];
    _deleteAt = json['deleteAt'];
    _returned = json['returned'];
    _description = json['description'];
    if (json['measurement'] != null) {
      _measurement = [];
      json['measurement'].forEach((v) {
        _measurement?.add(Measurement.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    if (json['assign'] != null) {
      _assign = [];
      json['assign'].forEach((v) {
        _assign?.add(Dynamic.fromJson(v));
      });
    }
    if (json['mail_history'] != null) {
      _mailHistory = [];
      json['mail_history'].forEach((v) {
        _mailHistory?.add(MailHistory.fromJson(v));
      });
    }
    _id = json['id'];
  }
  String? _id;
  Operator? _operator;
  String? _mailBoxId;
  String? _mailType;
  String? _mailStatus;
  int? _shered;
  bool? _shipped;
  dynamic _deleteAt;
  bool? _returned;
  dynamic _description;
  List<Measurement>? _measurement;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  List<dynamic>? _assign;
  List<MailHistory>? _mailHistory;
  String? _idAS;
  Data copyWith({
    String? id,
    Operator? operator,
    String? mailBoxId,
    String? mailType,
    String? mailStatus,
    int? shered,
    bool? shipped,
    dynamic deleteAt,
    bool? returned,
    dynamic description,
    List<Measurement>? measurement,
    String? createdAt,
    String? updatedAt,
    int? v,
    List<dynamic>? assign,
    List<MailHistory>? mailHistory,
    String? idAS,
  }) =>
      Data(
        id: id ?? _id,
        operator: operator ?? _operator,
        mailBoxId: mailBoxId ?? _mailBoxId,
        mailType: mailType ?? _mailType,
        mailStatus: mailStatus ?? _mailStatus,
        shered: shered ?? _shered,
        shipped: shipped ?? _shipped,
        deleteAt: deleteAt ?? _deleteAt,
        returned: returned ?? _returned,
        description: description ?? _description,
        measurement: measurement ?? _measurement,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
        assign: assign ?? _assign,
        mailHistory: mailHistory ?? _mailHistory,
        idAS: id ?? _id,
      );
  String? get id => _id;
  Operator? get operator => _operator;
  String? get mailBoxId => _mailBoxId;
  String? get mailType => _mailType;
  String? get mailStatus => _mailStatus;
  int? get shered => _shered;
  bool? get shipped => _shipped;
  dynamic get deleteAt => _deleteAt;
  bool? get returned => _returned;
  dynamic get description => _description;
  List<Measurement>? get measurement => _measurement;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;
  List<dynamic>? get assign => _assign;
  List<MailHistory>? get mailHistory => _mailHistory;
  String? get idAS => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    if (_operator != null) {
      map['operator'] = _operator?.toJson();
    }
    map['mail_box_id'] = _mailBoxId;
    map['mail_type'] = _mailType;
    map['mail_status'] = _mailStatus;
    map['shered'] = _shered;
    map['shipped'] = _shipped;
    map['deleteAt'] = _deleteAt;
    map['returned'] = _returned;
    map['description'] = _description;
    if (_measurement != null) {
      map['measurement'] = _measurement?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    if (_assign != null) {
      map['assign'] = _assign?.map((v) => v.toJson()).toList();
    }
    if (_mailHistory != null) {
      map['mail_history'] = _mailHistory?.map((v) => v.toJson()).toList();
    }
    map['id'] = _id;
    return map;
  }
}

class MailHistory {
  MailHistory({
    String? id,
    String? mailId,
    String? status,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _id = id;
    _mailId = mailId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  MailHistory.fromJson(dynamic json) {
    _id = json['_id'];
    _mailId = json['mail_id'];
    _status = json['status'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _mailId;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  MailHistory copyWith({
    String? id,
    String? mailId,
    String? status,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      MailHistory(
        id: id ?? _id,
        mailId: mailId ?? _mailId,
        status: status ?? _status,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  String? get id => _id;
  String? get mailId => _mailId;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['mail_id'] = _mailId;
    map['status'] = _status;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}

class Measurement {
  Measurement({
    String? file,
    int? weight,
    double? lbs,
    int? thickness,
    String? id,
  }) {
    _file = file;
    _weight = weight;
    _lbs = lbs;
    _thickness = thickness;
    _id = id;
  }

  Measurement.fromJson(dynamic json) {
    _file = json['file'];
    _weight = json['weight'];
    _lbs = json['lbs'];
    _thickness = json['thickness'];
    _id = json['_id'];
  }
  String? _file;
  int? _weight;
  double? _lbs;
  int? _thickness;
  String? _id;
  Measurement copyWith({
    String? file,
    int? weight,
    double? lbs,
    int? thickness,
    String? id,
  }) =>
      Measurement(
        file: file ?? _file,
        weight: weight ?? _weight,
        lbs: lbs ?? _lbs,
        thickness: thickness ?? _thickness,
        id: id ?? _id,
      );
  String? get file => _file;
  int? get weight => _weight;
  double? get lbs => _lbs;
  int? get thickness => _thickness;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = _file;
    map['weight'] = _weight;
    map['lbs'] = _lbs;
    map['thickness'] = _thickness;
    map['_id'] = _id;
    return map;
  }
}

class Operator {
  Operator({
    City? city,
    State? state,
    Country? country,
    String? id,
    String? businessName,
    String? fName,
    String? lName,
    String? appartmentNo,
    String? businessAddress,
    LocationAddress? locationAddress,
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
    String? feature,
    int? lastAssingMailNo,
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
    _locationAddress = locationAddress;
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
    _feature = feature;
    _lastAssingMailNo = lastAssingMailNo;
  }

  Operator.fromJson(dynamic json) {
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
    _locationAddress = json['location_address'] != null
        ? LocationAddress.fromJson(json['location_address'])
        : null;
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
        _range?.add(Dynamic.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _feature = json['feature'];
    _lastAssingMailNo = json['last_assing_mail_no'];
  }
  City? _city;
  State? _state;
  Country? _country;
  String? _id;
  String? _businessName;
  String? _fName;
  String? _lName;
  String? _appartmentNo;
  String? _businessAddress;
  LocationAddress? _locationAddress;
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
  String? _feature;
  int? _lastAssingMailNo;
  Operator copyWith({
    City? city,
    State? state,
    Country? country,
    String? id,
    String? businessName,
    String? fName,
    String? lName,
    String? appartmentNo,
    String? businessAddress,
    LocationAddress? locationAddress,
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
    String? feature,
    int? lastAssingMailNo,
  }) =>
      Operator(
        city: city ?? _city,
        state: state ?? _state,
        country: country ?? _country,
        id: id ?? _id,
        businessName: businessName ?? _businessName,
        fName: fName ?? _fName,
        lName: lName ?? _lName,
        appartmentNo: appartmentNo ?? _appartmentNo,
        businessAddress: businessAddress ?? _businessAddress,
        locationAddress: locationAddress ?? _locationAddress,
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
        feature: feature ?? _feature,
        lastAssingMailNo: lastAssingMailNo ?? _lastAssingMailNo,
      );
  City? get city => _city;
  State? get state => _state;
  Country? get country => _country;
  String? get id => _id;
  String? get businessName => _businessName;
  String? get fName => _fName;
  String? get lName => _lName;
  String? get appartmentNo => _appartmentNo;
  String? get businessAddress => _businessAddress;
  LocationAddress? get locationAddress => _locationAddress;
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
  String? get feature => _feature;
  int? get lastAssingMailNo => _lastAssingMailNo;

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
    if (_locationAddress != null) {
      map['location_address'] = _locationAddress?.toJson();
    }
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
    map['feature'] = _feature;
    map['last_assing_mail_no'] = _lastAssingMailNo;
    return map;
  }
}

class LocationAddress {
  LocationAddress({
    List<AddressComponents>? addressComponents,
    String? adrAddress,
    String? businessStatus,
    String? formattedAddress,
    String? formattedPhoneNumber,
    Geometry? geometry,
    String? icon,
    String? iconBackgroundColor,
    String? iconMaskBaseUri,
    String? internationalPhoneNumber,
    String? name,
    List<Photos>? photos,
    String? placeId,
    PlusCode? plusCode,
    double? rating,
    String? reference,
    List<Reviews>? reviews,
    List<String>? types,
    String? url,
    int? userRatingsTotal,
    int? utcOffset,
    String? vicinity,
    String? website,
    List<dynamic>? htmlAttributions,
    int? utcOffsetMinutes,
  }) {
    _addressComponents = addressComponents;
    _adrAddress = adrAddress;
    _businessStatus = businessStatus;
    _formattedAddress = formattedAddress;
    _formattedPhoneNumber = formattedPhoneNumber;
    _geometry = geometry;
    _icon = icon;
    _iconBackgroundColor = iconBackgroundColor;
    _iconMaskBaseUri = iconMaskBaseUri;
    _internationalPhoneNumber = internationalPhoneNumber;
    _name = name;
    _photos = photos;
    _placeId = placeId;
    _plusCode = plusCode;
    _rating = rating;
    _reference = reference;
    _reviews = reviews;
    _types = types;
    _url = url;
    _userRatingsTotal = userRatingsTotal;
    _utcOffset = utcOffset;
    _vicinity = vicinity;
    _website = website;
    _htmlAttributions = htmlAttributions;
    _utcOffsetMinutes = utcOffsetMinutes;
  }

  LocationAddress.fromJson(dynamic json) {
    if (json['address_components'] != null) {
      _addressComponents = [];
      json['address_components'].forEach((v) {
        _addressComponents?.add(AddressComponents.fromJson(v));
      });
    }
    _adrAddress = json['adr_address'];
    _businessStatus = json['business_status'];
    _formattedAddress = json['formatted_address'];
    _formattedPhoneNumber = json['formatted_phone_number'];
    _geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    _icon = json['icon'];
    _iconBackgroundColor = json['icon_background_color'];
    _iconMaskBaseUri = json['icon_mask_base_uri'];
    _internationalPhoneNumber = json['international_phone_number'];
    _name = json['name'];
    if (json['photos'] != null) {
      _photos = [];
      json['photos'].forEach((v) {
        _photos?.add(Photos.fromJson(v));
      });
    }
    _placeId = json['place_id'];
    _plusCode =
        json['plus_code'] != null ? PlusCode.fromJson(json['plus_code']) : null;
    _rating = json['rating'];
    _reference = json['reference'];
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
    _types = json['types'] != null ? json['types'].cast<String>() : [];
    _url = json['url'];
    _userRatingsTotal = json['user_ratings_total'];
    _utcOffset = json['utc_offset'];
    _vicinity = json['vicinity'];
    _website = json['website'];
    if (json['html_attributions'] != null) {
      _htmlAttributions = [];
      json['html_attributions'].forEach((v) {
        _htmlAttributions?.add(Dynamic.fromJson(v));
      });
    }
    _utcOffsetMinutes = json['utc_offset_minutes'];
  }
  List<AddressComponents>? _addressComponents;
  String? _adrAddress;
  String? _businessStatus;
  String? _formattedAddress;
  String? _formattedPhoneNumber;
  Geometry? _geometry;
  String? _icon;
  String? _iconBackgroundColor;
  String? _iconMaskBaseUri;
  String? _internationalPhoneNumber;
  String? _name;
  List<Photos>? _photos;
  String? _placeId;
  PlusCode? _plusCode;
  double? _rating;
  String? _reference;
  List<Reviews>? _reviews;
  List<String>? _types;
  String? _url;
  int? _userRatingsTotal;
  int? _utcOffset;
  String? _vicinity;
  String? _website;
  List<dynamic>? _htmlAttributions;
  int? _utcOffsetMinutes;
  LocationAddress copyWith({
    List<AddressComponents>? addressComponents,
    String? adrAddress,
    String? businessStatus,
    String? formattedAddress,
    String? formattedPhoneNumber,
    Geometry? geometry,
    String? icon,
    String? iconBackgroundColor,
    String? iconMaskBaseUri,
    String? internationalPhoneNumber,
    String? name,
    List<Photos>? photos,
    String? placeId,
    PlusCode? plusCode,
    double? rating,
    String? reference,
    List<Reviews>? reviews,
    List<String>? types,
    String? url,
    int? userRatingsTotal,
    int? utcOffset,
    String? vicinity,
    String? website,
    List<dynamic>? htmlAttributions,
    int? utcOffsetMinutes,
  }) =>
      LocationAddress(
        addressComponents: addressComponents ?? _addressComponents,
        adrAddress: adrAddress ?? _adrAddress,
        businessStatus: businessStatus ?? _businessStatus,
        formattedAddress: formattedAddress ?? _formattedAddress,
        formattedPhoneNumber: formattedPhoneNumber ?? _formattedPhoneNumber,
        geometry: geometry ?? _geometry,
        icon: icon ?? _icon,
        iconBackgroundColor: iconBackgroundColor ?? _iconBackgroundColor,
        iconMaskBaseUri: iconMaskBaseUri ?? _iconMaskBaseUri,
        internationalPhoneNumber:
            internationalPhoneNumber ?? _internationalPhoneNumber,
        name: name ?? _name,
        photos: photos ?? _photos,
        placeId: placeId ?? _placeId,
        plusCode: plusCode ?? _plusCode,
        rating: rating ?? _rating,
        reference: reference ?? _reference,
        reviews: reviews ?? _reviews,
        types: types ?? _types,
        url: url ?? _url,
        userRatingsTotal: userRatingsTotal ?? _userRatingsTotal,
        utcOffset: utcOffset ?? _utcOffset,
        vicinity: vicinity ?? _vicinity,
        website: website ?? _website,
        htmlAttributions: htmlAttributions ?? _htmlAttributions,
        utcOffsetMinutes: utcOffsetMinutes ?? _utcOffsetMinutes,
      );
  List<AddressComponents>? get addressComponents => _addressComponents;
  String? get adrAddress => _adrAddress;
  String? get businessStatus => _businessStatus;
  String? get formattedAddress => _formattedAddress;
  String? get formattedPhoneNumber => _formattedPhoneNumber;
  Geometry? get geometry => _geometry;
  String? get icon => _icon;
  String? get iconBackgroundColor => _iconBackgroundColor;
  String? get iconMaskBaseUri => _iconMaskBaseUri;
  String? get internationalPhoneNumber => _internationalPhoneNumber;
  String? get name => _name;
  List<Photos>? get photos => _photos;
  String? get placeId => _placeId;
  PlusCode? get plusCode => _plusCode;
  double? get rating => _rating;
  String? get reference => _reference;
  List<Reviews>? get reviews => _reviews;
  List<String>? get types => _types;
  String? get url => _url;
  int? get userRatingsTotal => _userRatingsTotal;
  int? get utcOffset => _utcOffset;
  String? get vicinity => _vicinity;
  String? get website => _website;
  List<dynamic>? get htmlAttributions => _htmlAttributions;
  int? get utcOffsetMinutes => _utcOffsetMinutes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_addressComponents != null) {
      map['address_components'] =
          _addressComponents?.map((v) => v.toJson()).toList();
    }
    map['adr_address'] = _adrAddress;
    map['business_status'] = _businessStatus;
    map['formatted_address'] = _formattedAddress;
    map['formatted_phone_number'] = _formattedPhoneNumber;
    if (_geometry != null) {
      map['geometry'] = _geometry?.toJson();
    }
    map['icon'] = _icon;
    map['icon_background_color'] = _iconBackgroundColor;
    map['icon_mask_base_uri'] = _iconMaskBaseUri;
    map['international_phone_number'] = _internationalPhoneNumber;
    map['name'] = _name;
    if (_photos != null) {
      map['photos'] = _photos?.map((v) => v.toJson()).toList();
    }
    map['place_id'] = _placeId;
    if (_plusCode != null) {
      map['plus_code'] = _plusCode?.toJson();
    }
    map['rating'] = _rating;
    map['reference'] = _reference;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['types'] = _types;
    map['url'] = _url;
    map['user_ratings_total'] = _userRatingsTotal;
    map['utc_offset'] = _utcOffset;
    map['vicinity'] = _vicinity;
    map['website'] = _website;
    if (_htmlAttributions != null) {
      map['html_attributions'] =
          _htmlAttributions?.map((v) => v.toJson()).toList();
    }
    map['utc_offset_minutes'] = _utcOffsetMinutes;
    return map;
  }
}

class Reviews {
  Reviews({
    String? authorName,
    String? authorUrl,
    String? language,
    String? profilePhotoUrl,
    int? rating,
    String? relativeTimeDescription,
    String? text,
    int? time,
  }) {
    _authorName = authorName;
    _authorUrl = authorUrl;
    _language = language;
    _profilePhotoUrl = profilePhotoUrl;
    _rating = rating;
    _relativeTimeDescription = relativeTimeDescription;
    _text = text;
    _time = time;
  }

  Reviews.fromJson(dynamic json) {
    _authorName = json['author_name'];
    _authorUrl = json['author_url'];
    _language = json['language'];
    _profilePhotoUrl = json['profile_photo_url'];
    _rating = json['rating'];
    _relativeTimeDescription = json['relative_time_description'];
    _text = json['text'];
    _time = json['time'];
  }
  String? _authorName;
  String? _authorUrl;
  String? _language;
  String? _profilePhotoUrl;
  int? _rating;
  String? _relativeTimeDescription;
  String? _text;
  int? _time;
  Reviews copyWith({
    String? authorName,
    String? authorUrl,
    String? language,
    String? profilePhotoUrl,
    int? rating,
    String? relativeTimeDescription,
    String? text,
    int? time,
  }) =>
      Reviews(
        authorName: authorName ?? _authorName,
        authorUrl: authorUrl ?? _authorUrl,
        language: language ?? _language,
        profilePhotoUrl: profilePhotoUrl ?? _profilePhotoUrl,
        rating: rating ?? _rating,
        relativeTimeDescription:
            relativeTimeDescription ?? _relativeTimeDescription,
        text: text ?? _text,
        time: time ?? _time,
      );
  String? get authorName => _authorName;
  String? get authorUrl => _authorUrl;
  String? get language => _language;
  String? get profilePhotoUrl => _profilePhotoUrl;
  int? get rating => _rating;
  String? get relativeTimeDescription => _relativeTimeDescription;
  String? get text => _text;
  int? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author_name'] = _authorName;
    map['author_url'] = _authorUrl;
    map['language'] = _language;
    map['profile_photo_url'] = _profilePhotoUrl;
    map['rating'] = _rating;
    map['relative_time_description'] = _relativeTimeDescription;
    map['text'] = _text;
    map['time'] = _time;
    return map;
  }
}

class PlusCode {
  PlusCode({
    String? compoundCode,
    String? globalCode,
  }) {
    _compoundCode = compoundCode;
    _globalCode = globalCode;
  }

  PlusCode.fromJson(dynamic json) {
    _compoundCode = json['compound_code'];
    _globalCode = json['global_code'];
  }
  String? _compoundCode;
  String? _globalCode;
  PlusCode copyWith({
    String? compoundCode,
    String? globalCode,
  }) =>
      PlusCode(
        compoundCode: compoundCode ?? _compoundCode,
        globalCode: globalCode ?? _globalCode,
      );
  String? get compoundCode => _compoundCode;
  String? get globalCode => _globalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['compound_code'] = _compoundCode;
    map['global_code'] = _globalCode;
    return map;
  }
}

class Photos {
  Photos({
    int? height,
    List<String>? htmlAttributions,
    int? width,
  }) {
    _height = height;
    _htmlAttributions = htmlAttributions;
    _width = width;
  }

  Photos.fromJson(dynamic json) {
    _height = json['height'];
    _htmlAttributions = json['html_attributions'] != null
        ? json['html_attributions'].cast<String>()
        : [];
    _width = json['width'];
  }
  int? _height;
  List<String>? _htmlAttributions;
  int? _width;
  Photos copyWith({
    int? height,
    List<String>? htmlAttributions,
    int? width,
  }) =>
      Photos(
        height: height ?? _height,
        htmlAttributions: htmlAttributions ?? _htmlAttributions,
        width: width ?? _width,
      );
  int? get height => _height;
  List<String>? get htmlAttributions => _htmlAttributions;
  int? get width => _width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = _height;
    map['html_attributions'] = _htmlAttributions;
    map['width'] = _width;
    return map;
  }
}

class Geometry {
  Geometry({
    Location? location,
    Viewport? viewport,
  }) {
    _location = location;
    _viewport = viewport;
  }

  Geometry.fromJson(dynamic json) {
    _location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    _viewport =
        json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null;
  }
  Location? _location;
  Viewport? _viewport;
  Geometry copyWith({
    Location? location,
    Viewport? viewport,
  }) =>
      Geometry(
        location: location ?? _location,
        viewport: viewport ?? _viewport,
      );
  Location? get location => _location;
  Viewport? get viewport => _viewport;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    if (_viewport != null) {
      map['viewport'] = _viewport?.toJson();
    }
    return map;
  }
}

class Viewport {
  Viewport({
    double? south,
    double? west,
    double? north,
    double? east,
  }) {
    _south = south;
    _west = west;
    _north = north;
    _east = east;
  }

  Viewport.fromJson(dynamic json) {
    _south = json['south'];
    _west = json['west'];
    _north = json['north'];
    _east = json['east'];
  }
  double? _south;
  double? _west;
  double? _north;
  double? _east;
  Viewport copyWith({
    double? south,
    double? west,
    double? north,
    double? east,
  }) =>
      Viewport(
        south: south ?? _south,
        west: west ?? _west,
        north: north ?? _north,
        east: east ?? _east,
      );
  double? get south => _south;
  double? get west => _west;
  double? get north => _north;
  double? get east => _east;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['south'] = _south;
    map['west'] = _west;
    map['north'] = _north;
    map['east'] = _east;
    return map;
  }
}

class Location {
  Location({
    double? lat,
    double? lng,
  }) {
    _lat = lat;
    _lng = lng;
  }

  Location.fromJson(dynamic json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }
  double? _lat;
  double? _lng;
  Location copyWith({
    double? lat,
    double? lng,
  }) =>
      Location(
        lat: lat ?? _lat,
        lng: lng ?? _lng,
      );
  double? get lat => _lat;
  double? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }
}

class AddressComponents {
  AddressComponents({
    String? longName,
    String? shortName,
    List<String>? types,
  }) {
    _longName = longName;
    _shortName = shortName;
    _types = types;
  }

  AddressComponents.fromJson(dynamic json) {
    _longName = json['long_name'];
    _shortName = json['short_name'];
    _types = json['types'] != null ? json['types'].cast<String>() : [];
  }
  String? _longName;
  String? _shortName;
  List<String>? _types;
  AddressComponents copyWith({
    String? longName,
    String? shortName,
    List<String>? types,
  }) =>
      AddressComponents(
        longName: longName ?? _longName,
        shortName: shortName ?? _shortName,
        types: types ?? _types,
      );
  String? get longName => _longName;
  String? get shortName => _shortName;
  List<String>? get types => _types;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['long_name'] = _longName;
    map['short_name'] = _shortName;
    map['types'] = _types;
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
