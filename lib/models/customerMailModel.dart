class CustomerMailModel {
  CustomerMailModel({
    bool? status,
    String? msg,
    List<Data>? data,
    int? dataa,
    int? total,
  }) {
    _status = status;
    _msg = msg;
    _data = data;
    _dataa = dataa;
    _total = total;
  }

  CustomerMailModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _dataa = json['dataa'];
    _total = json['total'];
  }
  bool? _status;
  String? _msg;
  List<Data>? _data;
  int? _dataa;
  int? _total;
  CustomerMailModel copyWith({
    bool? status,
    String? msg,
    List<Data>? data,
    int? dataa,
    int? total,
  }) =>
      CustomerMailModel(
        status: status ?? _status,
        msg: msg ?? _msg,
        data: data ?? _data,
        dataa: dataa ?? _dataa,
        total: total ?? _total,
      );
  bool? get status => _status;
  String? get msg => _msg;
  List<Data>? get data => _data;
  int? get dataa => _dataa;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['dataa'] = _dataa;
    map['total'] = _total;
    return map;
  }
}

class Data {
  Data({
    ScanData? scanData,
    String? id,
    MailId? mailId,
    Reciver? reciver,
    String? sender,
    dynamic openScan,
    bool? trash,
    bool? important,
    dynamic rescan,
    dynamic recycle,
    dynamic shred,
    dynamic shipmentStatus,
    dynamic pickupStatus,
    bool? returned,
    bool? markAsRead,
    bool? isDelete,
    dynamic deleteAt,
    String? currentStatus,
    String? createdAt,
    String? updatedAt,
    int? v,
    List<dynamic>? shippedDetails,
    List<MailHistory>? mailHistory,
    String? idi,
  }) {
    _scanData = scanData;
    _id = id;
    _mailId = mailId;
    _reciver = reciver;
    _sender = sender;
    _openScan = openScan;
    _trash = trash;
    _important = important;
    _rescan = rescan;
    _recycle = recycle;
    _shred = shred;
    _shipmentStatus = shipmentStatus;
    _pickupStatus = pickupStatus;
    _returned = returned;
    _markAsRead = markAsRead;
    _isDelete = isDelete;
    _deleteAt = deleteAt;
    _currentStatus = currentStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _shippedDetails = shippedDetails;
    _mailHistory = mailHistory;
    _id = id;
  }

  Data.fromJson(dynamic json) {
    _scanData =
        json['scan_data'] != null ? ScanData.fromJson(json['scan_data']) : null;
    _id = json['_id'];
    _mailId = json['mail_id'] != null ? MailId.fromJson(json['mail_id']) : null;
    _reciver =
        json['reciver'] != null ? Reciver.fromJson(json['reciver']) : null;
    _sender = json['sender'];
    _openScan = json['open_scan'];
    _trash = json['trash'];
    _important = json['important'];
    _rescan = json['rescan'];
    _recycle = json['recycle'];
    _shred = json['shred'];
    _return = json['return'];
    _shipmentStatus = json['shipment_status'];
    _pickupStatus = json['pickup_status'];
    _returned = json['returned'];
    _markAsRead = json['mark_as_read'];
    _isDelete = json['isDelete'];
    _deleteAt = json['deleteAt'];
    _currentStatus = json['current_status'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    if (json['shipped_details'] != null) {
      _shippedDetails = [];
      json['shipped_details'].forEach((v) {
        _shippedDetails?.add(Dynamic.fromJson(v));
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
  ScanData? _scanData;
  String? _id;
  MailId? _mailId;
  Reciver? _reciver;
  String? _sender;
  dynamic _openScan;
  bool? _trash;
  bool? _important;
  dynamic _rescan;
  dynamic _recycle;
  dynamic _shred;
  dynamic _return;
  dynamic _shipmentStatus;
  dynamic _pickupStatus;
  bool? _returned;
  bool? _markAsRead;
  bool? _isDelete;
  dynamic _deleteAt;
  String? _currentStatus;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  List<dynamic>? _shippedDetails;
  List<MailHistory>? _mailHistory;
  String? _ida;
  Data copyWith({
    ScanData? scanData,
    String? id,
    MailId? mailId,
    Reciver? reciver,
    String? sender,
    dynamic openScan,
    bool? trash,
    bool? important,
    dynamic rescan,
    dynamic recycle,
    dynamic shred,
    dynamic shipmentStatus,
    dynamic pickupStatus,
    bool? returned,
    bool? markAsRead,
    bool? isDelete,
    dynamic deleteAt,
    String? currentStatus,
    String? createdAt,
    String? updatedAt,
    int? v,
    List<dynamic>? shippedDetails,
    List<MailHistory>? mailHistory,
    String? ida,
  }) =>
      Data(
        scanData: scanData ?? _scanData,
        id: id ?? _id,
        mailId: mailId ?? _mailId,
        reciver: reciver ?? _reciver,
        sender: sender ?? _sender,
        openScan: openScan ?? _openScan,
        trash: trash ?? _trash,
        important: important ?? _important,
        rescan: rescan ?? _rescan,
        recycle: recycle ?? _recycle,
        shred: shred ?? _shred,
        shipmentStatus: shipmentStatus ?? _shipmentStatus,
        pickupStatus: pickupStatus ?? _pickupStatus,
        returned: returned ?? _returned,
        markAsRead: markAsRead ?? _markAsRead,
        isDelete: isDelete ?? _isDelete,
        deleteAt: deleteAt ?? _deleteAt,
        currentStatus: currentStatus ?? _currentStatus,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
        shippedDetails: shippedDetails ?? _shippedDetails,
        mailHistory: mailHistory ?? _mailHistory,
      );
  ScanData? get scanData => _scanData;
  String? get id => _id;
  MailId? get mailId => _mailId;
  Reciver? get reciver => _reciver;
  String? get sender => _sender;
  dynamic get openScan => _openScan;
  bool? get trash => _trash;
  bool? get important => _important;
  dynamic get rescan => _rescan;
  dynamic get recycle => _recycle;
  dynamic get shred => _shred;
  dynamic get shipmentStatus => _shipmentStatus;
  dynamic get pickupStatus => _pickupStatus;
  bool? get returned => _returned;
  bool? get markAsRead => _markAsRead;
  bool? get isDelete => _isDelete;
  dynamic get deleteAt => _deleteAt;
  String? get currentStatus => _currentStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;
  List<dynamic>? get shippedDetails => _shippedDetails;
  List<MailHistory>? get mailHistory => _mailHistory;
  String? get idi => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_scanData != null) {
      map['scan_data'] = _scanData?.toJson();
    }
    map['_id'] = _id;
    if (_mailId != null) {
      map['mail_id'] = _mailId?.toJson();
    }
    if (_reciver != null) {
      map['reciver'] = _reciver?.toJson();
    }
    map['sender'] = _sender;
    map['open_scan'] = _openScan;
    map['trash'] = _trash;
    map['important'] = _important;
    map['rescan'] = _rescan;
    map['recycle'] = _recycle;
    map['shred'] = _shred;
    map['return'] = _return;
    map['shipment_status'] = _shipmentStatus;
    map['pickup_status'] = _pickupStatus;
    map['returned'] = _returned;
    map['mark_as_read'] = _markAsRead;
    map['isDelete'] = _isDelete;
    map['deleteAt'] = _deleteAt;
    map['current_status'] = _currentStatus;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    if (_shippedDetails != null) {
      map['shipped_details'] = _shippedDetails?.map((v) => v.toJson()).toList();
    }
    if (_mailHistory != null) {
      map['mail_history'] = _mailHistory?.map((v) => v.toJson()).toList();
    }
    map['id'] = _id;
    return map;
  }
}

class Dynamic {
  static fromJson(v) {}
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

class Reciver {
  Reciver({
    Plan? plan,
    String? id,
    String? accountType,
    String? mailBoxNum,
    String? fname,
    String? lname,
    String? username,
    String? email,
    String? phone,
    dynamic businessName,
    String? uspsStatus,
    PlanId? planId,
    String? feature,
    String? softCash,
    String? cusId,
    bool? isDeleted,
    String? paymentStatus,
    int? v,
    String? ida,
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
    _businessName = businessName;
    _uspsStatus = uspsStatus;
    _planId = planId;
    _feature = feature;
    _softCash = softCash;
    _cusId = cusId;
    _isDeleted = isDeleted;
    _paymentStatus = paymentStatus;
    _v = v;
    _id = id;
  }

  Reciver.fromJson(dynamic json) {
    _plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
    _id = json['_id'];
    _accountType = json['accountType'];
    _mailBoxNum = json['mail_box_num'];
    _fname = json['fname'];
    _lname = json['lname'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _businessName = json['business_name'];
    _uspsStatus = json['usps_status'];
    _planId = json['plan_id'] != null ? PlanId.fromJson(json['plan_id']) : null;
    _feature = json['feature'];
    _softCash = json['soft_cash'];
    _cusId = json['cus_id'];
    _isDeleted = json['isDeleted'];
    _paymentStatus = json['payment_status'];
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
  dynamic _businessName;
  String? _uspsStatus;
  PlanId? _planId;
  String? _feature;
  String? _softCash;
  String? _cusId;
  bool? _isDeleted;
  String? _paymentStatus;
  int? _v;
  String? _ida;
  Reciver copyWith({
    Plan? plan,
    String? id,
    String? accountType,
    String? mailBoxNum,
    String? fname,
    String? lname,
    String? username,
    String? email,
    String? phone,
    dynamic businessName,
    String? uspsStatus,
    PlanId? planId,
    String? feature,
    String? softCash,
    String? cusId,
    bool? isDeleted,
    String? paymentStatus,
    int? v,
    String? idi,
  }) =>
      Reciver(
        plan: plan ?? _plan,
        id: id ?? _ida,
        accountType: accountType ?? _accountType,
        mailBoxNum: mailBoxNum ?? _mailBoxNum,
        fname: fname ?? _fname,
        lname: lname ?? _lname,
        username: username ?? _username,
        email: email ?? _email,
        phone: phone ?? _phone,
        businessName: businessName ?? _businessName,
        uspsStatus: uspsStatus ?? _uspsStatus,
        planId: planId ?? _planId,
        feature: feature ?? _feature,
        softCash: softCash ?? _softCash,
        cusId: cusId ?? _cusId,
        isDeleted: isDeleted ?? _isDeleted,
        paymentStatus: paymentStatus ?? _paymentStatus,
        v: v ?? _v,
      );
  Plan? get plan => _plan;
  String? get id => _ida;
  String? get accountType => _accountType;
  String? get mailBoxNum => _mailBoxNum;
  String? get fname => _fname;
  String? get lname => _lname;
  String? get username => _username;
  String? get email => _email;
  String? get phone => _phone;
  dynamic get businessName => _businessName;
  String? get uspsStatus => _uspsStatus;
  PlanId? get planId => _planId;
  String? get feature => _feature;
  String? get softCash => _softCash;
  String? get cusId => _cusId;
  bool? get isDeleted => _isDeleted;
  String? get paymentStatus => _paymentStatus;
  int? get v => _v;

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
    map['business_name'] = _businessName;
    map['usps_status'] = _uspsStatus;
    if (_planId != null) {
      map['plan_id'] = _planId?.toJson();
    }
    map['feature'] = _feature;
    map['soft_cash'] = _softCash;
    map['cus_id'] = _cusId;
    map['isDeleted'] = _isDeleted;
    map['payment_status'] = _paymentStatus;
    map['__v'] = _v;
    map['id'] = _id;
    return map;
  }
}

class PlanId {
  PlanId({
    IncomingMail? incomingMail,
    OpenScan? openScan,
    Recipients? recipients,
    Shred? shred,
    LocalPickup? localPickup,
    Recycle? recycle,
    PhysicalStorage? physicalStorage,
    String? id,
    String? type,
    String? name,
    String? price,
    int? onlineStorage,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _incomingMail = incomingMail;
    _openScan = openScan;
    _recipients = recipients;
    _shred = shred;
    _localPickup = localPickup;
    _recycle = recycle;
    _physicalStorage = physicalStorage;
    _id = id;
    _type = type;
    _name = name;
    _price = price;
    _onlineStorage = onlineStorage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  PlanId.fromJson(dynamic json) {
    _incomingMail = json['incoming_mail'] != null
        ? IncomingMail.fromJson(json['incoming_mail'])
        : null;
    _openScan =
        json['open_scan'] != null ? OpenScan.fromJson(json['open_scan']) : null;
    _recipients = json['recipients'] != null
        ? Recipients.fromJson(json['recipients'])
        : null;
    _shred = json['shred'] != null ? Shred.fromJson(json['shred']) : null;
    _localPickup = json['local_pickup'] != null
        ? LocalPickup.fromJson(json['local_pickup'])
        : null;
    _recycle =
        json['recycle'] != null ? Recycle.fromJson(json['recycle']) : null;
    _physicalStorage = json['physical_storage'] != null
        ? PhysicalStorage.fromJson(json['physical_storage'])
        : null;
    _id = json['_id'];
    _type = json['type'];
    _name = json['name'];
    _price = json['price'];
    _onlineStorage = json['online_storage'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  IncomingMail? _incomingMail;
  OpenScan? _openScan;
  Recipients? _recipients;
  Shred? _shred;
  LocalPickup? _localPickup;
  Recycle? _recycle;
  PhysicalStorage? _physicalStorage;
  String? _id;
  String? _type;
  String? _name;
  String? _price;
  int? _onlineStorage;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  PlanId copyWith({
    IncomingMail? incomingMail,
    OpenScan? openScan,
    Recipients? recipients,
    Shred? shred,
    LocalPickup? localPickup,
    Recycle? recycle,
    PhysicalStorage? physicalStorage,
    String? id,
    String? type,
    String? name,
    String? price,
    int? onlineStorage,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      PlanId(
        incomingMail: incomingMail ?? _incomingMail,
        openScan: openScan ?? _openScan,
        recipients: recipients ?? _recipients,
        shred: shred ?? _shred,
        localPickup: localPickup ?? _localPickup,
        recycle: recycle ?? _recycle,
        physicalStorage: physicalStorage ?? _physicalStorage,
        id: id ?? _id,
        type: type ?? _type,
        name: name ?? _name,
        price: price ?? _price,
        onlineStorage: onlineStorage ?? _onlineStorage,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  IncomingMail? get incomingMail => _incomingMail;
  OpenScan? get openScan => _openScan;
  Recipients? get recipients => _recipients;
  Shred? get shred => _shred;
  LocalPickup? get localPickup => _localPickup;
  Recycle? get recycle => _recycle;
  PhysicalStorage? get physicalStorage => _physicalStorage;
  String? get id => _id;
  String? get type => _type;
  String? get name => _name;
  String? get price => _price;
  int? get onlineStorage => _onlineStorage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_incomingMail != null) {
      map['incoming_mail'] = _incomingMail?.toJson();
    }
    if (_openScan != null) {
      map['open_scan'] = _openScan?.toJson();
    }
    if (_recipients != null) {
      map['recipients'] = _recipients?.toJson();
    }
    if (_shred != null) {
      map['shred'] = _shred?.toJson();
    }
    if (_localPickup != null) {
      map['local_pickup'] = _localPickup?.toJson();
    }
    if (_recycle != null) {
      map['recycle'] = _recycle?.toJson();
    }
    if (_physicalStorage != null) {
      map['physical_storage'] = _physicalStorage?.toJson();
    }
    map['_id'] = _id;
    map['type'] = _type;
    map['name'] = _name;
    map['price'] = _price;
    map['online_storage'] = _onlineStorage;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}

class PhysicalStorage {
  PhysicalStorage({
    StandardEnvelope? standardEnvelope,
    LargeEnvelope? largeEnvelope,
    PaddedMailer? paddedMailer,
    SmallBox? smallBox,
    MailingTube? mailingTube,
    MediumBox? mediumBox,
    LargeBox? largeBox,
    ExtraLargeBox? extraLargeBox,
  }) {
    _standardEnvelope = standardEnvelope;
    _largeEnvelope = largeEnvelope;
    _paddedMailer = paddedMailer;
    _smallBox = smallBox;
    _mailingTube = mailingTube;
    _mediumBox = mediumBox;
    _largeBox = largeBox;
    _extraLargeBox = extraLargeBox;
  }

  PhysicalStorage.fromJson(dynamic json) {
    _standardEnvelope = json['standard_envelope'] != null
        ? StandardEnvelope.fromJson(json['standard_envelope'])
        : null;
    _largeEnvelope = json['large_envelope'] != null
        ? LargeEnvelope.fromJson(json['large_envelope'])
        : null;
    _paddedMailer = json['padded_mailer'] != null
        ? PaddedMailer.fromJson(json['padded_mailer'])
        : null;
    _smallBox =
        json['small_box'] != null ? SmallBox.fromJson(json['small_box']) : null;
    _mailingTube = json['mailing_tube'] != null
        ? MailingTube.fromJson(json['mailing_tube'])
        : null;
    _mediumBox = json['medium_box'] != null
        ? MediumBox.fromJson(json['medium_box'])
        : null;
    _largeBox =
        json['large_box'] != null ? LargeBox.fromJson(json['large_box']) : null;
    _extraLargeBox = json['extra_large_box'] != null
        ? ExtraLargeBox.fromJson(json['extra_large_box'])
        : null;
  }
  StandardEnvelope? _standardEnvelope;
  LargeEnvelope? _largeEnvelope;
  PaddedMailer? _paddedMailer;
  SmallBox? _smallBox;
  MailingTube? _mailingTube;
  MediumBox? _mediumBox;
  LargeBox? _largeBox;
  ExtraLargeBox? _extraLargeBox;
  PhysicalStorage copyWith({
    StandardEnvelope? standardEnvelope,
    LargeEnvelope? largeEnvelope,
    PaddedMailer? paddedMailer,
    SmallBox? smallBox,
    MailingTube? mailingTube,
    MediumBox? mediumBox,
    LargeBox? largeBox,
    ExtraLargeBox? extraLargeBox,
  }) =>
      PhysicalStorage(
        standardEnvelope: standardEnvelope ?? _standardEnvelope,
        largeEnvelope: largeEnvelope ?? _largeEnvelope,
        paddedMailer: paddedMailer ?? _paddedMailer,
        smallBox: smallBox ?? _smallBox,
        mailingTube: mailingTube ?? _mailingTube,
        mediumBox: mediumBox ?? _mediumBox,
        largeBox: largeBox ?? _largeBox,
        extraLargeBox: extraLargeBox ?? _extraLargeBox,
      );
  StandardEnvelope? get standardEnvelope => _standardEnvelope;
  LargeEnvelope? get largeEnvelope => _largeEnvelope;
  PaddedMailer? get paddedMailer => _paddedMailer;
  SmallBox? get smallBox => _smallBox;
  MailingTube? get mailingTube => _mailingTube;
  MediumBox? get mediumBox => _mediumBox;
  LargeBox? get largeBox => _largeBox;
  ExtraLargeBox? get extraLargeBox => _extraLargeBox;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_standardEnvelope != null) {
      map['standard_envelope'] = _standardEnvelope?.toJson();
    }
    if (_largeEnvelope != null) {
      map['large_envelope'] = _largeEnvelope?.toJson();
    }
    if (_paddedMailer != null) {
      map['padded_mailer'] = _paddedMailer?.toJson();
    }
    if (_smallBox != null) {
      map['small_box'] = _smallBox?.toJson();
    }
    if (_mailingTube != null) {
      map['mailing_tube'] = _mailingTube?.toJson();
    }
    if (_mediumBox != null) {
      map['medium_box'] = _mediumBox?.toJson();
    }
    if (_largeBox != null) {
      map['large_box'] = _largeBox?.toJson();
    }
    if (_extraLargeBox != null) {
      map['extra_large_box'] = _extraLargeBox?.toJson();
    }
    return map;
  }
}

class ExtraLargeBox {
  ExtraLargeBox({
    String? charges,
    int? count,
  }) {
    _charges = charges;
    _count = count;
  }

  ExtraLargeBox.fromJson(dynamic json) {
    _charges = json['charges'];
    _count = json['count'];
  }
  String? _charges;
  int? _count;
  ExtraLargeBox copyWith({
    String? charges,
    int? count,
  }) =>
      ExtraLargeBox(
        charges: charges ?? _charges,
        count: count ?? _count,
      );
  String? get charges => _charges;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['charges'] = _charges;
    map['count'] = _count;
    return map;
  }
}

class LargeBox {
  LargeBox({
    String? charges,
    int? count,
  }) {
    _charges = charges;
    _count = count;
  }

  LargeBox.fromJson(dynamic json) {
    _charges = json['charges'];
    _count = json['count'];
  }
  String? _charges;
  int? _count;
  LargeBox copyWith({
    String? charges,
    int? count,
  }) =>
      LargeBox(
        charges: charges ?? _charges,
        count: count ?? _count,
      );
  String? get charges => _charges;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['charges'] = _charges;
    map['count'] = _count;
    return map;
  }
}

class MediumBox {
  MediumBox({
    String? charges,
    int? count,
  }) {
    _charges = charges;
    _count = count;
  }

  MediumBox.fromJson(dynamic json) {
    _charges = json['charges'];
    _count = json['count'];
  }
  String? _charges;
  int? _count;
  MediumBox copyWith({
    String? charges,
    int? count,
  }) =>
      MediumBox(
        charges: charges ?? _charges,
        count: count ?? _count,
      );
  String? get charges => _charges;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['charges'] = _charges;
    map['count'] = _count;
    return map;
  }
}

class MailingTube {
  MailingTube({
    String? charges,
    int? count,
  }) {
    _charges = charges;
    _count = count;
  }

  MailingTube.fromJson(dynamic json) {
    _charges = json['charges'];
    _count = json['count'];
  }
  String? _charges;
  int? _count;
  MailingTube copyWith({
    String? charges,
    int? count,
  }) =>
      MailingTube(
        charges: charges ?? _charges,
        count: count ?? _count,
      );
  String? get charges => _charges;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['charges'] = _charges;
    map['count'] = _count;
    return map;
  }
}

class SmallBox {
  SmallBox({
    String? charges,
    int? count,
  }) {
    _charges = charges;
    _count = count;
  }

  SmallBox.fromJson(dynamic json) {
    _charges = json['charges'];
    _count = json['count'];
  }
  String? _charges;
  int? _count;
  SmallBox copyWith({
    String? charges,
    int? count,
  }) =>
      SmallBox(
        charges: charges ?? _charges,
        count: count ?? _count,
      );
  String? get charges => _charges;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['charges'] = _charges;
    map['count'] = _count;
    return map;
  }
}

class PaddedMailer {
  PaddedMailer({
    String? charges,
    int? count,
  }) {
    _charges = charges;
    _count = count;
  }

  PaddedMailer.fromJson(dynamic json) {
    _charges = json['charges'];
    _count = json['count'];
  }
  String? _charges;
  int? _count;
  PaddedMailer copyWith({
    String? charges,
    int? count,
  }) =>
      PaddedMailer(
        charges: charges ?? _charges,
        count: count ?? _count,
      );
  String? get charges => _charges;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['charges'] = _charges;
    map['count'] = _count;
    return map;
  }
}

class LargeEnvelope {
  LargeEnvelope({
    String? charges,
    int? count,
  }) {
    _charges = charges;
    _count = count;
  }

  LargeEnvelope.fromJson(dynamic json) {
    _charges = json['charges'];
    _count = json['count'];
  }
  String? _charges;
  int? _count;
  LargeEnvelope copyWith({
    String? charges,
    int? count,
  }) =>
      LargeEnvelope(
        charges: charges ?? _charges,
        count: count ?? _count,
      );
  String? get charges => _charges;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['charges'] = _charges;
    map['count'] = _count;
    return map;
  }
}

class StandardEnvelope {
  StandardEnvelope({
    String? charges,
    int? count,
  }) {
    _charges = charges;
    _count = count;
  }

  StandardEnvelope.fromJson(dynamic json) {
    _charges = json['charges'];
    _count = json['count'];
  }
  String? _charges;
  int? _count;
  StandardEnvelope copyWith({
    String? charges,
    int? count,
  }) =>
      StandardEnvelope(
        charges: charges ?? _charges,
        count: count ?? _count,
      );
  String? get charges => _charges;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['charges'] = _charges;
    map['count'] = _count;
    return map;
  }
}

class Recycle {
  Recycle({
    int? count,
    String? charges,
  }) {
    _count = count;
    _charges = charges;
  }

  Recycle.fromJson(dynamic json) {
    _count = json['count'];
    _charges = json['charges'];
  }
  int? _count;
  String? _charges;
  Recycle copyWith({
    int? count,
    String? charges,
  }) =>
      Recycle(
        count: count ?? _count,
        charges: charges ?? _charges,
      );
  int? get count => _count;
  String? get charges => _charges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['charges'] = _charges;
    return map;
  }
}

class LocalPickup {
  LocalPickup({
    int? count,
    String? charges,
  }) {
    _count = count;
    _charges = charges;
  }

  LocalPickup.fromJson(dynamic json) {
    _count = json['count'];
    _charges = json['charges'];
  }
  int? _count;
  String? _charges;
  LocalPickup copyWith({
    int? count,
    String? charges,
  }) =>
      LocalPickup(
        count: count ?? _count,
        charges: charges ?? _charges,
      );
  int? get count => _count;
  String? get charges => _charges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['charges'] = _charges;
    return map;
  }
}

class Shred {
  Shred({
    int? count,
    String? charges,
  }) {
    _count = count;
    _charges = charges;
  }

  Shred.fromJson(dynamic json) {
    _count = json['count'];
    _charges = json['charges'];
  }
  int? _count;
  String? _charges;
  Shred copyWith({
    int? count,
    String? charges,
  }) =>
      Shred(
        count: count ?? _count,
        charges: charges ?? _charges,
      );
  int? get count => _count;
  String? get charges => _charges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['charges'] = _charges;
    return map;
  }
}

class Recipients {
  Recipients({
    int? count,
    String? charges,
  }) {
    _count = count;
    _charges = charges;
  }

  Recipients.fromJson(dynamic json) {
    _count = json['count'];
    _charges = json['charges'];
  }
  int? _count;
  String? _charges;
  Recipients copyWith({
    int? count,
    String? charges,
  }) =>
      Recipients(
        count: count ?? _count,
        charges: charges ?? _charges,
      );
  int? get count => _count;
  String? get charges => _charges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['charges'] = _charges;
    return map;
  }
}

class OpenScan {
  OpenScan({
    int? count,
    String? charges,
  }) {
    _count = count;
    _charges = charges;
  }

  OpenScan.fromJson(dynamic json) {
    _count = json['count'];
    _charges = json['charges'];
  }
  int? _count;
  String? _charges;
  OpenScan copyWith({
    int? count,
    String? charges,
  }) =>
      OpenScan(
        count: count ?? _count,
        charges: charges ?? _charges,
      );
  int? get count => _count;
  String? get charges => _charges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['charges'] = _charges;
    return map;
  }
}

class IncomingMail {
  IncomingMail({
    int? count,
    String? charges,
  }) {
    _count = count;
    _charges = charges;
  }

  IncomingMail.fromJson(dynamic json) {
    _count = json['count'];
    _charges = json['charges'];
  }
  int? _count;
  String? _charges;
  IncomingMail copyWith({
    int? count,
    String? charges,
  }) =>
      IncomingMail(
        count: count ?? _count,
        charges: charges ?? _charges,
      );
  int? get count => _count;
  String? get charges => _charges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['charges'] = _charges;
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

class MailId {
  MailId({
    String? id,
    String? operator,
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
    String? ida,
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
    _id = id;
  }

  MailId.fromJson(dynamic json) {
    _id = json['_id'];
    _operator = json['operator'];
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
    _id = json['id'];
  }
  String? _id;
  String? _operator;
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
  String? _ida;
  MailId copyWith({
    String? id,
    String? operator,
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
    String? ida,
  }) =>
      MailId(
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
        ida: id ?? _ida,
      );
  String? get id => _id;
  String? get operator => _operator;
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
  String? get ida => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['operator'] = _operator;
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
    map['id'] = _id;
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

class ScanData {
  ScanData({
    dynamic contentType,
    List<dynamic>? file,
  }) {
    _contentType = contentType;
    _file = file;
  }

  ScanData.fromJson(dynamic json) {
    _contentType = json['content_type'];
    if (json['file'] != null) {
      _file = [];
      json['file'].forEach((v) {
        _file?.add(Dynamic.fromJson(v));
      });
    }
  }
  dynamic _contentType;
  List<dynamic>? _file;
  ScanData copyWith({
    dynamic contentType,
    List<dynamic>? file,
  }) =>
      ScanData(
        contentType: contentType ?? _contentType,
        file: file ?? _file,
      );
  dynamic get contentType => _contentType;
  List<dynamic>? get file => _file;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content_type'] = _contentType;
    if (_file != null) {
      map['file'] = _file?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ShippedDetails {
  ShippedDetails({
    String? id,
    String? mailId,
    ShippingAddress? shippingAddress,
    String? instructions,
    bool? insurance,
    String? shipmentCareer,
    String? insuranceAmt,
    String? createdAt,
    String? updatedAt,
    int? v,
    double? shippingCost,
    int? trackingNumber,
  }) {
    _id = id;
    _mailId = mailId;
    _shippingAddress = shippingAddress;
    _instructions = instructions;
    _insurance = insurance;
    _shipmentCareer = shipmentCareer;
    _insuranceAmt = insuranceAmt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _shippingCost = shippingCost;
    _trackingNumber = trackingNumber;
  }

  ShippedDetails.fromJson(dynamic json) {
    _id = json['_id'];
    _mailId = json['mail_id'];
    _shippingAddress = json['shipping_address'] != null
        ? ShippingAddress.fromJson(json['shipping_address'])
        : null;
    _instructions = json['instructions'];
    _insurance = json['insurance'];
    _shipmentCareer = json['shipment_career'];
    _insuranceAmt = json['insurance_amt'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _shippingCost = json['shipping_cost'];
    _trackingNumber = json['tracking_number'];
  }
  String? _id;
  String? _mailId;
  ShippingAddress? _shippingAddress;
  String? _instructions;
  bool? _insurance;
  String? _shipmentCareer;
  String? _insuranceAmt;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  double? _shippingCost;
  int? _trackingNumber;
  ShippedDetails copyWith({
    String? id,
    String? mailId,
    ShippingAddress? shippingAddress,
    String? instructions,
    bool? insurance,
    String? shipmentCareer,
    String? insuranceAmt,
    String? createdAt,
    String? updatedAt,
    int? v,
    double? shippingCost,
    int? trackingNumber,
  }) =>
      ShippedDetails(
        id: id ?? _id,
        mailId: mailId ?? _mailId,
        shippingAddress: shippingAddress ?? _shippingAddress,
        instructions: instructions ?? _instructions,
        insurance: insurance ?? _insurance,
        shipmentCareer: shipmentCareer ?? _shipmentCareer,
        insuranceAmt: insuranceAmt ?? _insuranceAmt,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
        shippingCost: shippingCost ?? _shippingCost,
        trackingNumber: trackingNumber ?? _trackingNumber,
      );
  String? get id => _id;
  String? get mailId => _mailId;
  ShippingAddress? get shippingAddress => _shippingAddress;
  String? get instructions => _instructions;
  bool? get insurance => _insurance;
  String? get shipmentCareer => _shipmentCareer;
  String? get insuranceAmt => _insuranceAmt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;
  double? get shippingCost => _shippingCost;
  int? get trackingNumber => _trackingNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['mail_id'] = _mailId;
    if (_shippingAddress != null) {
      map['shipping_address'] = _shippingAddress?.toJson();
    }
    map['instructions'] = _instructions;
    map['insurance'] = _insurance;
    map['shipment_career'] = _shipmentCareer;
    map['insurance_amt'] = _insuranceAmt;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['shipping_cost'] = _shippingCost;
    map['tracking_number'] = _trackingNumber;
    return map;
  }
}

class ShippingAddress {
  ShippingAddress({
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

  ShippingAddress.fromJson(dynamic json) {
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
    _postalCode = json['postal_code'];
    _phone = json['phone'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
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
  ShippingAddress copyWith({
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
  }) =>
      ShippingAddress(
        country: country ?? _country,
        city: city ?? _city,
        state: state ?? _state,
        id: id ?? _id,
        user: user ?? _user,
        name: name ?? _name,
        company: company ?? _company,
        address1: address1 ?? _address1,
        address2: address2 ?? _address2,
        postalCode: postalCode ?? _postalCode,
        phone: phone ?? _phone,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
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
