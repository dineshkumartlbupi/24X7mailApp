class UploadImageModel {
  UploadImageModel({
    bool? status,
    Data? data,
    String? msg,
  }) {
    _status = status;
    _data = data;
    _msg = msg;
  }

  UploadImageModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _msg = json['msg'];
  }
  bool? _status;
  Data? _data;
  String? _msg;
  UploadImageModel copyWith({
    bool? status,
    Data? data,
    String? msg,
  }) =>
      UploadImageModel(
        status: status ?? _status,
        data: data ?? _data,
        msg: msg ?? _msg,
      );
  bool? get status => _status;
  Data? get data => _data;
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['msg'] = _msg;
    return map;
  }
}

class Data {
  Data({
    Plan? plan,
    String? id,
    String? accountType,
    String? mailBoxNum,
    String? fname,
    String? lname,
    String? username,
    String? email,
    String? phone,
    String? userType,
    dynamic businessName,
    String? userStatus,
    List<String>? usps,
    String? uspsStatus,
    String? password,
    String? planId,
    String? feature,
    dynamic refreshToken,
    String? softCash,
    String? cusId,
    bool? isDeleted,
    String? paymentStatus,
    String? createdAt,
    String? updatedAt,
    int? v,
    String? idi,
  }) {
    _plan = plan;
    _id = id;
    _accountType = accountType;
    _mailBoxNum = mailBoxNum;
    _fname = fname;
    _lname = lname;
    _username = username;
    _email = email;
    _phone = phone;
    _userType = userType;
    _businessName = businessName;
    _userStatus = userStatus;
    _usps = usps;
    _uspsStatus = uspsStatus;
    _password = password;
    _planId = planId;
    _feature = feature;
    _refreshToken = refreshToken;
    _softCash = softCash;
    _cusId = cusId;
    _isDeleted = isDeleted;
    _paymentStatus = paymentStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _id = id;
  }

  Data.fromJson(dynamic json) {
    _plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
    _id = json['_id'];
    _accountType = json['accountType'];
    _mailBoxNum = json['mail_box_num'];
    _fname = json['fname'];
    _lname = json['lname'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _userType = json['user_type'];
    _businessName = json['business_name'];
    _userStatus = json['user_status'];
    _usps = json['usps'] != null ? json['usps'].cast<String>() : [];
    _uspsStatus = json['usps_status'];
    _password = json['password'];
    _planId = json['plan_id'];
    _feature = json['feature'];
    _refreshToken = json['refreshToken'];
    _softCash = json['soft_cash'];
    _cusId = json['cus_id'];
    _isDeleted = json['isDeleted'];
    _paymentStatus = json['payment_status'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _id = json['id'];
  }
  Plan? _plan;
  String? _id;
  String? _accountType;
  String? _mailBoxNum;
  String? _fname;
  String? _lname;
  String? _username;
  String? _email;
  String? _phone;
  String? _userType;
  dynamic _businessName;
  String? _userStatus;
  List<String>? _usps;
  String? _uspsStatus;
  String? _password;
  String? _planId;
  String? _feature;
  dynamic _refreshToken;
  String? _softCash;
  String? _cusId;
  bool? _isDeleted;
  String? _paymentStatus;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  String? _idi;
  Data copyWith({
    Plan? plan,
    String? id,
    String? accountType,
    String? mailBoxNum,
    String? fname,
    String? lname,
    String? username,
    String? email,
    String? phone,
    String? userType,
    dynamic businessName,
    String? userStatus,
    List<String>? usps,
    String? uspsStatus,
    String? password,
    String? planId,
    String? feature,
    dynamic refreshToken,
    String? softCash,
    String? cusId,
    bool? isDeleted,
    String? paymentStatus,
    String? createdAt,
    String? updatedAt,
    int? v,
    String? idi,
  }) =>
      Data(
        plan: plan ?? _plan,
        id: id ?? _id,
        accountType: accountType ?? _accountType,
        mailBoxNum: mailBoxNum ?? _mailBoxNum,
        fname: fname ?? _fname,
        lname: lname ?? _lname,
        username: username ?? _username,
        email: email ?? _email,
        phone: phone ?? _phone,
        userType: userType ?? _userType,
        businessName: businessName ?? _businessName,
        userStatus: userStatus ?? _userStatus,
        usps: usps ?? _usps,
        uspsStatus: uspsStatus ?? _uspsStatus,
        password: password ?? _password,
        planId: planId ?? _planId,
        feature: feature ?? _feature,
        refreshToken: refreshToken ?? _refreshToken,
        softCash: softCash ?? _softCash,
        cusId: cusId ?? _cusId,
        isDeleted: isDeleted ?? _isDeleted,
        paymentStatus: paymentStatus ?? _paymentStatus,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
        idi: id ?? _id,
      );
  Plan? get plan => _plan;
  String? get id => _id;
  String? get accountType => _accountType;
  String? get mailBoxNum => _mailBoxNum;
  String? get fname => _fname;
  String? get lname => _lname;
  String? get username => _username;
  String? get email => _email;
  String? get phone => _phone;
  String? get userType => _userType;
  dynamic get businessName => _businessName;
  String? get userStatus => _userStatus;
  List<String>? get usps => _usps;
  String? get uspsStatus => _uspsStatus;
  String? get password => _password;
  String? get planId => _planId;
  String? get feature => _feature;
  dynamic get refreshToken => _refreshToken;
  String? get softCash => _softCash;
  String? get cusId => _cusId;
  bool? get isDeleted => _isDeleted;
  String? get paymentStatus => _paymentStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;
  String? get idi => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_plan != null) {
      map['plan'] = _plan?.toJson();
    }
    map['_id'] = _id;
    map['accountType'] = _accountType;
    map['mail_box_num'] = _mailBoxNum;
    map['fname'] = _fname;
    map['lname'] = _lname;
    map['username'] = _username;
    map['email'] = _email;
    map['phone'] = _phone;
    map['user_type'] = _userType;
    map['business_name'] = _businessName;
    map['user_status'] = _userStatus;
    map['usps'] = _usps;
    map['usps_status'] = _uspsStatus;
    map['password'] = _password;
    map['plan_id'] = _planId;
    map['feature'] = _feature;
    map['refreshToken'] = _refreshToken;
    map['soft_cash'] = _softCash;
    map['cus_id'] = _cusId;
    map['isDeleted'] = _isDeleted;
    map['payment_status'] = _paymentStatus;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['id'] = _id;
    return map;
  }
}

class Plan {
  Plan({
    dynamic expiredAt,
    dynamic planType,
  }) {
    _expiredAt = expiredAt;
    _planType = planType;
  }

  Plan.fromJson(dynamic json) {
    _expiredAt = json['expired_at'];
    _planType = json['plan_type'];
  }
  dynamic _expiredAt;
  dynamic _planType;
  Plan copyWith({
    dynamic expiredAt,
    dynamic planType,
  }) =>
      Plan(
        expiredAt: expiredAt ?? _expiredAt,
        planType: planType ?? _planType,
      );
  dynamic get expiredAt => _expiredAt;
  dynamic get planType => _planType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['expired_at'] = _expiredAt;
    map['plan_type'] = _planType;
    return map;
  }
}
