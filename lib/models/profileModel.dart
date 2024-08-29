class UserModel {
  bool? status;
  UserData? data;
  String? msg;
  String? token;

  UserModel({this.status, this.data, this.msg, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    msg = json['msg'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    if (status != null) {
      result['status'] = status;
    }
    if (data != null) {
      result['data'] = data!.toJson();
    }
    if (msg != null) {
      result['msg'] = msg;
    }
    if (token != null) {
      result['token'] = token;
    }
    return result;
  }
}

class UserData {
  Plan? plan;
  String? id;
  String? accountType;
  String? mailBoxNum;
  String? fname;
  String? lname;
  String? username;
  String? email;
  String? phone;
  String? userType;
  String? businessName;
  String? userStatus;
  List<dynamic>? usps;
  String? uspsStatus;
  String? password;
  PlanDetails? planId;
  Feature? feature;
  String? zipCode;
  int? storeId;
  String? approveStatus;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lastAssignMailNo;
  String? refreshToken;
  String? softCash;
  String? cusId;
  String? paymentStatus;
  List<Subscription>? subscription;

  UserData({
    this.plan,
    this.id,
    this.accountType,
    this.mailBoxNum,
    this.fname,
    this.lname,
    this.username,
    this.email,
    this.phone,
    this.userType,
    this.businessName,
    this.userStatus,
    this.usps,
    this.uspsStatus,
    this.password,
    this.planId,
    this.feature,
    this.zipCode,
    this.storeId,
    this.approveStatus,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.lastAssignMailNo,
    this.refreshToken,
    this.softCash,
    this.cusId,
    this.paymentStatus,
    this.subscription,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
    id = json['_id'];
    accountType = json['accountType'];
    mailBoxNum = json['mail_box_num'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'] as String;
    userType = json['user_type'];
    businessName = json['business_name'];
    userStatus = json['user_status'];
    usps = json['usps'];
    uspsStatus = json['usps_status'];
    password = json['password'];
    planId =
        json['plan_id'] != null ? PlanDetails.fromJson(json['plan_id']) : null;
    feature =
        json['feature'] != null ? Feature.fromJson(json['feature']) : null;
    zipCode = json['zip_code'];
    storeId = json['store_id'];
    approveStatus = json['approve_status'];
    isDeleted = json['isDeleted'];
    createdAt =
        json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null;
    updatedAt =
        json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null;
    lastAssignMailNo = json['last_assing_mail_no'];
    refreshToken = json['refreshToken'];
    softCash = json['soft_cash'];
    cusId = json['cus_id'];
    paymentStatus = json['payment_status'];
    if (json['subscription'] != null) {
      subscription = <Subscription>[];
      json['subscription'].forEach((v) {
        subscription!.add(Subscription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    if (id != null) {
      data['_id'] = id;
    }
    if (accountType != null) {
      data['accountType'] = accountType;
    }
    if (mailBoxNum != null) {
      data['mail_box_num'] = mailBoxNum;
    }
    if (fname != null) {
      data['fname'] = fname;
    }
    if (lname != null) {
      data['lname'] = lname;
    }
    if (username != null) {
      data['username'] = username;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (phone != null) {
      data['phone'] = phone;
    }
    if (userType != null) {
      data['user_type'] = userType;
    }
    if (businessName != null) {
      data['business_name'] = businessName;
    }
    if (userStatus != null) {
      data['user_status'] = userStatus;
    }
    if (usps != null) {
      data['usps'] = usps;
    }
    if (uspsStatus != null) {
      data['usps_status'] = uspsStatus;
    }
    if (password != null) {
      data['password'] = password;
    }
    if (planId != null) {
      data['plan_id'] = planId!.toJson();
    }
    if (feature != null) {
      data['feature'] = feature!.toJson();
    }
    if (zipCode != null) {
      data['zip_code'] = zipCode;
    }
    if (storeId != null) {
      data['store_id'] = storeId;
    }
    if (approveStatus != null) {
      data['approve_status'] = approveStatus;
    }
    if (isDeleted != null) {
      data['isDeleted'] = isDeleted;
    }
    if (createdAt != null) {
      data['createdAt'] = createdAt!.toIso8601String();
    }
    if (updatedAt != null) {
      data['updatedAt'] = updatedAt!.toIso8601String();
    }
    if (lastAssignMailNo != null) {
      data['last_assing_mail_no'] = lastAssignMailNo;
    }
    if (refreshToken != null) {
      data['refreshToken'] = refreshToken;
    }
    if (softCash != null) {
      data['soft_cash'] = softCash;
    }
    if (cusId != null) {
      data['cus_id'] = cusId;
    }
    if (paymentStatus != null) {
      data['payment_status'] = paymentStatus;
    }
    if (subscription != null) {
      data['subscription'] = subscription!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subscription {
  String? id;
  String? name;

  Subscription({this.id, this.name});

  Subscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) {
      data['id'] = id;
    }
    if (name != null) {
      data['name'] = name;
    }
    return data;
  }
}

class Plan {
  String? expiredAt;
  String? planType;

  Plan({this.expiredAt, this.planType});

  Plan.fromJson(Map<String, dynamic> json) {
    expiredAt = json['expired_at'];
    planType = json['plan_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (expiredAt != null) {
      data['expired_at'] = expiredAt;
    }
    if (planType != null) {
      data['plan_type'] = planType;
    }
    return data;
  }
}

class PlanDetails {
  CountCharges? incomingMail;
  CountCharges? openScan;
  CountCharges? recipients;
  CountCharges? shred;
  CountCharges? localPickup;
  CountCharges? recycle;
  PhysicalStorage? physicalStorage;
  String? id;
  String? type;
  String? name;
  String? price;
  int? onlineStorage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PlanDetails({
    this.incomingMail,
    this.openScan,
    this.recipients,
    this.shred,
    this.localPickup,
    this.recycle,
    this.physicalStorage,
    this.id,
    this.type,
    this.name,
    this.price,
    this.onlineStorage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  PlanDetails.fromJson(Map<String, dynamic> json) {
    incomingMail = json['incoming_mail'] != null
        ? CountCharges.fromJson(json['incoming_mail'])
        : null;
    openScan = json['open_scan'] != null
        ? CountCharges.fromJson(json['open_scan'])
        : null;
    recipients = json['recipients'] != null
        ? CountCharges.fromJson(json['recipients'])
        : null;
    shred = json['shred'] != null ? CountCharges.fromJson(json['shred']) : null;
    localPickup = json['local_pickup'] != null
        ? CountCharges.fromJson(json['local_pickup'])
        : null;
    recycle =
        json['recycle'] != null ? CountCharges.fromJson(json['recycle']) : null;
    physicalStorage = json['physical_storage'] != null
        ? PhysicalStorage.fromJson(json['physical_storage'])
        : null;
    id = json['_id'];
    type = json['type'];
    name = json['name'];
    price = json['price'];
    onlineStorage = json['online_storage'];
    createdAt =
        json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null;
    updatedAt =
        json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null;
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (incomingMail != null) {
      data['incoming_mail'] = incomingMail!.toJson();
    }
    if (openScan != null) {
      data['open_scan'] = openScan!.toJson();
    }
    if (recipients != null) {
      data['recipients'] = recipients!.toJson();
    }
    if (shred != null) {
      data['shred'] = shred!.toJson();
    }
    if (localPickup != null) {
      data['local_pickup'] = localPickup!.toJson();
    }
    if (recycle != null) {
      data['recycle'] = recycle!.toJson();
    }
    if (physicalStorage != null) {
      data['physical_storage'] = physicalStorage!.toJson();
    }
    if (id != null) {
      data['_id'] = id;
    }
    if (type != null) {
      data['type'] = type;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (price != null) {
      data['price'] = price;
    }
    if (onlineStorage != null) {
      data['online_storage'] = onlineStorage;
    }
    if (createdAt != null) {
      data['createdAt'] = createdAt!.toIso8601String();
    }
    if (updatedAt != null) {
      data['updatedAt'] = updatedAt!.toIso8601String();
    }
    if (v != null) {
      data['__v'] = v;
    }
    return data;
  }
}

class CountCharges {
  String? duration;
  String? charges;

  CountCharges({this.duration, this.charges});

  CountCharges.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    charges = json['charges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (duration != null) {
      data['duration'] = duration;
    }
    if (charges != null) {
      data['charges'] = charges;
    }
    return data;
  }
}

class PhysicalStorage {
  String? duration;
  String? charges;

  PhysicalStorage({this.duration, this.charges});

  PhysicalStorage.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    charges = json['charges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (duration != null) {
      data['duration'] = duration;
    }
    if (charges != null) {
      data['charges'] = charges;
    }
    return data;
  }
}

class Feature {
  Geometry? geometry;
  FeatureProperties? properties;

  Feature({this.geometry, this.properties});

  Feature.fromJson(Map<String, dynamic> json) {
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    properties = json['properties'] != null
        ? FeatureProperties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }
    return data;
  }
}

class FeatureProperties {
  FeatureDetails? featureDetails;

  FeatureProperties({this.featureDetails});

  FeatureProperties.fromJson(Map<String, dynamic> json) {
    featureDetails = json['feature_details'] != null
        ? FeatureDetails.fromJson(json['feature_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (featureDetails != null) {
      data['feature_details'] = featureDetails!.toJson();
    }
    return data;
  }
}

class FeatureDetails {
  City? city;
  State? state;
  Country? country;
  String? businessName;
  String? fName;
  String? lName;
  String? businessAddress;
  String? formattedAddress;

  FeatureDetails({
    this.city,
    this.state,
    this.country,
    this.businessName,
    this.fName,
    this.lName,
    this.businessAddress,
    this.formattedAddress,
  });

  FeatureDetails.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    businessName = json['business_name'];
    fName = json['f_name'];
    lName = json['l_name'];
    businessAddress = json['business_address'];
    formattedAddress = json['formatted_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (businessName != null) {
      data['business_name'] = businessName;
    }
    if (fName != null) {
      data['f_name'] = fName;
    }
    if (lName != null) {
      data['l_name'] = lName;
    }
    if (businessAddress != null) {
      data['business_address'] = businessAddress;
    }
    if (formattedAddress != null) {
      data['formatted_address'] = formattedAddress;
    }
    return data;
  }
}

class City {
  int? cityId;
  int? stateId;
  String? name;

  City({this.cityId, this.stateId, this.name});

  City.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    stateId = json['state_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (cityId != null) {
      data['city_id'] = cityId;
    }
    if (stateId != null) {
      data['state_id'] = stateId;
    }
    if (name != null) {
      data['name'] = name;
    }
    return data;
  }
}

class State {
  int? stateId;
  int? countryId;
  String? name;

  State({this.stateId, this.countryId, this.name});

  State.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    countryId = json['country_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (stateId != null) {
      data['state_id'] = stateId;
    }
    if (countryId != null) {
      data['country_id'] = countryId;
    }
    if (name != null) {
      data['name'] = name;
    }
    return data;
  }
}

class Country {
  int? countryId;
  String? name;

  Country({this.countryId, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (countryId != null) {
      data['country_id'] = countryId;
    }
    if (name != null) {
      data['name'] = name;
    }
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (type != null) {
      data['type'] = type;
    }
    if (coordinates != null) {
      data['coordinates'] = coordinates;
    }
    return data;
  }
}

class Properties {
  String? address;
  String? city;
  String? country;
  String? postalCode;
  String? state;

  Properties({
    this.address,
    this.city,
    this.country,
    this.postalCode,
    this.state,
  });

  Properties.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    country = json['country'];
    postalCode = json['postalCode'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (address != null) {
      data['address'] = address;
    }
    if (city != null) {
      data['city'] = city;
    }
    if (country != null) {
      data['country'] = country;
    }
    if (postalCode != null) {
      data['postalCode'] = postalCode;
    }
    if (state != null) {
      data['state'] = state;
    }
    return data;
  }
}
