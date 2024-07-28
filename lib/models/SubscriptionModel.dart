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
    _id = json['_id'];
    _userId = json['user_id'];
    _planId = json['plan_id'] != null ? PlanId.fromJson(json['plan_id']) : null;
    _planDetail = json['plan_detail'] != null
        ? PlanDetail.fromJson(json['plan_detail'])
        : null;
    _amount = json['amount'];
    _paymentMode = json['payment_mode'];
    _description = json['description'];
    _paymentStatus = json['payment_status'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
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
