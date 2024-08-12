class SubscriptionModel {
  SubscriptionModel({
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

  SubscriptionModel.fromJson(dynamic json) {
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

  SubscriptionModel copyWith({
    bool? status,
    String? msg,
    List<Data>? data,
    int? total,
  }) =>
      SubscriptionModel(
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
    String? userId,
    PlanId? planId,
    PlanDetail? planDetail,
    String? amount,
    String? paymentMode,
    String? description,
    int? paymentStatus,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _id = id;
    _userId = userId;
    _planId = planId;
    _planDetail = planDetail;
    _amount = amount;
    _paymentMode = paymentMode;
    _description = description;
    _paymentStatus = paymentStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'] ?? '';
    _userId = json['user_id'] ?? '';
    _planId = json['plan_id'] != null ? PlanId.fromJson(json['plan_id']) : null;
    _planDetail = json['plan_detail'] != null
        ? PlanDetail.fromJson(json['plan_detail'])
        : null;
    _amount = json['amount'] ?? '0';
    _paymentMode = json['payment_mode'] ?? '';
    _description = json['description'] ?? "";
    _paymentStatus = json['payment_status'] ?? "";
    _createdAt = json['createdAt'] ?? '';
    _updatedAt = json['updatedAt'] ?? '';
    _v = json['__v'] ?? '';
  }

  String? _id;
  String? _userId;
  PlanId? _planId;
  PlanDetail? _planDetail;
  String? _amount;
  String? _paymentMode;
  String? _description;
  int? _paymentStatus;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  Data copyWith({
    String? id,
    String? userId,
    PlanId? planId,
    PlanDetail? planDetail,
    String? amount,
    String? paymentMode,
    String? description,
    int? paymentStatus,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      Data(
        id: id ?? _id,
        userId: userId ?? _userId,
        planId: planId ?? _planId,
        planDetail: planDetail ?? _planDetail,
        amount: amount ?? _amount,
        paymentMode: paymentMode ?? _paymentMode,
        description: description ?? _description,
        paymentStatus: paymentStatus ?? _paymentStatus,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );

  String? get id => _id;
  String? get userId => _userId;
  PlanId? get planId => _planId;
  PlanDetail? get planDetail => _planDetail;
  String? get amount => _amount;
  String? get paymentMode => _paymentMode;
  String? get description => _description;
  int? get paymentStatus => _paymentStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user_id'] = _userId;
    if (_planId != null) {
      map['plan_id'] = _planId?.toJson();
    }
    if (_planDetail != null) {
      map['plan_detail'] = _planDetail?.toJson();
    }
    map['amount'] = _amount;
    map['payment_mode'] = _paymentMode;
    map['description'] = _description;
    map['payment_status'] = _paymentStatus;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}

class PlanDetail {
  PlanDetail({
    String? name,
  }) {
    _name = name;
  }

  PlanDetail.fromJson(dynamic json) {
    _name = json['name'];
  }

  String? _name;

  PlanDetail copyWith({
    String? name,
  }) =>
      PlanDetail(
        name: name ?? _name,
      );

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
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
    ForwardingLetter? forwardingLetter,
  }) {
    _standardEnvelope = standardEnvelope;
    _forwardingLetter = forwardingLetter;
  }

  PhysicalStorage.fromJson(dynamic json) {
    _standardEnvelope = json['standard_envelope'] != null
        ? StandardEnvelope.fromJson(json['standard_envelope'])
        : null;
    _forwardingLetter = json['forwarding_letter'] != null
        ? ForwardingLetter.fromJson(json['forwarding_letter'])
        : null;
  }

  StandardEnvelope? _standardEnvelope;
  ForwardingLetter? _forwardingLetter;

  PhysicalStorage copyWith({
    StandardEnvelope? standardEnvelope,
    ForwardingLetter? forwardingLetter,
  }) =>
      PhysicalStorage(
        standardEnvelope: standardEnvelope ?? _standardEnvelope,
        forwardingLetter: forwardingLetter ?? _forwardingLetter,
      );

  StandardEnvelope? get standardEnvelope => _standardEnvelope;
  ForwardingLetter? get forwardingLetter => _forwardingLetter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_standardEnvelope != null) {
      map['standard_envelope'] = _standardEnvelope?.toJson();
    }
    if (_forwardingLetter != null) {
      map['forwarding_letter'] = _forwardingLetter?.toJson();
    }
    return map;
  }
}

class StandardEnvelope {
  StandardEnvelope({
    int? price,
    int? quantity,
  }) {
    _price = price;
    _quantity = quantity;
  }

  StandardEnvelope.fromJson(dynamic json) {
    _price = json['price'];
    _quantity = json['quantity'];
  }

  int? _price;
  int? _quantity;

  StandardEnvelope copyWith({
    int? price,
    int? quantity,
  }) =>
      StandardEnvelope(
        price: price ?? _price,
        quantity: quantity ?? _quantity,
      );

  int? get price => _price;
  int? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    map['quantity'] = _quantity;
    return map;
  }
}

class ForwardingLetter {
  ForwardingLetter({
    int? price,
    int? quantity,
  }) {
    _price = price;
    _quantity = quantity;
  }

  ForwardingLetter.fromJson(dynamic json) {
    _price = json['price'];
    _quantity = json['quantity'];
  }

  int? _price;
  int? _quantity;

  ForwardingLetter copyWith({
    int? price,
    int? quantity,
  }) =>
      ForwardingLetter(
        price: price ?? _price,
        quantity: quantity ?? _quantity,
      );

  int? get price => _price;
  int? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    map['quantity'] = _quantity;
    return map;
  }
}

class IncomingMail {
  IncomingMail({
    int? quantity,
    int? used,
  }) {
    _quantity = quantity;
    _used = used;
  }

  IncomingMail.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _used = json['used'];
  }

  int? _quantity;
  int? _used;

  IncomingMail copyWith({
    int? quantity,
    int? used,
  }) =>
      IncomingMail(
        quantity: quantity ?? _quantity,
        used: used ?? _used,
      );

  int? get quantity => _quantity;
  int? get used => _used;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['used'] = _used;
    return map;
  }
}

class OpenScan {
  OpenScan({
    int? quantity,
    int? used,
  }) {
    _quantity = quantity;
    _used = used;
  }

  OpenScan.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _used = json['used'];
  }

  int? _quantity;
  int? _used;

  OpenScan copyWith({
    int? quantity,
    int? used,
  }) =>
      OpenScan(
        quantity: quantity ?? _quantity,
        used: used ?? _used,
      );

  int? get quantity => _quantity;
  int? get used => _used;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['used'] = _used;
    return map;
  }
}

class Recipients {
  Recipients({
    int? quantity,
    int? used,
  }) {
    _quantity = quantity;
    _used = used;
  }

  Recipients.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _used = json['used'];
  }

  int? _quantity;
  int? _used;

  Recipients copyWith({
    int? quantity,
    int? used,
  }) =>
      Recipients(
        quantity: quantity ?? _quantity,
        used: used ?? _used,
      );

  int? get quantity => _quantity;
  int? get used => _used;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['used'] = _used;
    return map;
  }
}

class Shred {
  Shred({
    int? quantity,
    int? used,
  }) {
    _quantity = quantity;
    _used = used;
  }

  Shred.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _used = json['used'];
  }

  int? _quantity;
  int? _used;

  Shred copyWith({
    int? quantity,
    int? used,
  }) =>
      Shred(
        quantity: quantity ?? _quantity,
        used: used ?? _used,
      );

  int? get quantity => _quantity;
  int? get used => _used;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['used'] = _used;
    return map;
  }
}

class LocalPickup {
  LocalPickup({
    int? quantity,
    int? used,
  }) {
    _quantity = quantity;
    _used = used;
  }

  LocalPickup.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _used = json['used'];
  }

  int? _quantity;
  int? _used;

  LocalPickup copyWith({
    int? quantity,
    int? used,
  }) =>
      LocalPickup(
        quantity: quantity ?? _quantity,
        used: used ?? _used,
      );

  int? get quantity => _quantity;
  int? get used => _used;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['used'] = _used;
    return map;
  }
}

class Recycle {
  Recycle({
    int? quantity,
    int? used,
  }) {
    _quantity = quantity;
    _used = used;
  }

  Recycle.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _used = json['used'];
  }

  int? _quantity;
  int? _used;

  Recycle copyWith({
    int? quantity,
    int? used,
  }) =>
      Recycle(
        quantity: quantity ?? _quantity,
        used: used ?? _used,
      );

  int? get quantity => _quantity;
  int? get used => _used;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['used'] = _used;
    return map;
  }
}
