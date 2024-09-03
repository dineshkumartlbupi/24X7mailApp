class OperationModel {
  OperationModel({
    bool? status,
    int? count,
    List<Data>? data,
  }) {
    _status = status;
    _count = count;
    _data = data;
  }

  OperationModel.fromJson(dynamic json) {
    _status = json['status'];
    _count = json['count'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  int? _count;
  List<Data>? _data;
  OperationModel copyWith({
    bool? status,
    int? count,
    List<Data>? data,
  }) =>
      OperationModel(
        status: status ?? _status,
        count: count ?? _count,
        data: data ?? _data,
      );
  bool? get status => _status;
  int? get count => _count;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['count'] = _count;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    Userinfo? userinfo,
    int? assignCount,
    int? openScanCount,
    int? shredCount,
    int? rescanCount,
    int? recyleCount,
    int? shipmentCount,
    int? pickupCount,
    int? total,
  }) {
    _userinfo = userinfo;
    _assignCount = assignCount;
    _openScanCount = openScanCount;
    _shredCount = shredCount;
    _rescanCount = rescanCount;
    _recyleCount = recyleCount;
    _shipmentCount = shipmentCount;
    _pickupCount = pickupCount;
    _total = total;
  }

  Data.fromJson(dynamic json) {
    _userinfo =
        json['userinfo'] != null ? Userinfo.fromJson(json['userinfo']) : null;
    _assignCount = json['assign_count'];
    _openScanCount = json['open_scan_count'];
    _shredCount = json['shred_count'];
    _rescanCount = json['rescan_count'];
    _recyleCount = json['recyle_count'];
    _shipmentCount = json['shipment_count'];
    _pickupCount = json['pickup_count'];
    _total = json['total'];
  }
  Userinfo? _userinfo;
  int? _assignCount;
  int? _openScanCount;
  int? _shredCount;
  int? _rescanCount;
  int? _recyleCount;
  int? _shipmentCount;
  int? _pickupCount;
  int? _total;
  Data copyWith({
    Userinfo? userinfo,
    int? assignCount,
    int? openScanCount,
    int? shredCount,
    int? rescanCount,
    int? recyleCount,
    int? shipmentCount,
    int? pickupCount,
    int? total,
  }) =>
      Data(
        userinfo: userinfo ?? _userinfo,
        assignCount: assignCount ?? _assignCount,
        openScanCount: openScanCount ?? _openScanCount,
        shredCount: shredCount ?? _shredCount,
        rescanCount: rescanCount ?? _rescanCount,
        recyleCount: recyleCount ?? _recyleCount,
        shipmentCount: shipmentCount ?? _shipmentCount,
        pickupCount: pickupCount ?? _pickupCount,
        total: total ?? _total,
      );
  Userinfo? get userinfo => _userinfo;
  int? get assignCount => _assignCount;
  int? get openScanCount => _openScanCount;
  int? get shredCount => _shredCount;
  int? get rescanCount => _rescanCount;
  int? get recyleCount => _recyleCount;
  int? get shipmentCount => _shipmentCount;
  int? get pickupCount => _pickupCount;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userinfo != null) {
      map['userinfo'] = _userinfo?.toJson();
    }
    map['assign_count'] = _assignCount;
    map['open_scan_count'] = _openScanCount;
    map['shred_count'] = _shredCount;
    map['rescan_count'] = _rescanCount;
    map['recyle_count'] = _recyleCount;
    map['shipment_count'] = _shipmentCount;
    map['pickup_count'] = _pickupCount;
    map['total'] = _total;
    return map;
  }
}

class Userinfo {
  Userinfo({
    String? id,
    String? mailBoxNum,
    String? fname,
    String? lname,
    String? ids,
  }) {
    _id = id;
    _mailBoxNum = mailBoxNum;
    _fname = fname;
    _lname = lname;
    _id = id;
  }

  Userinfo.fromJson(dynamic json) {
    _id = json['_id'];
    _mailBoxNum = json['mail_box_num'];
    _fname = json['fname'];
    _lname = json['lname'];
    _id = json['id'];
  }
  String? _id;
  String? _mailBoxNum;
  String? _fname;
  String? _lname;
  String? _ids;
  Userinfo copyWith({
    String? id,
    String? mailBoxNum,
    String? fname,
    String? lname,
    String? ids,
  }) =>
      Userinfo(
        id: id ?? _id,
        mailBoxNum: mailBoxNum ?? _mailBoxNum,
        fname: fname ?? _fname,
        lname: lname ?? _lname,
        ids: id ?? _id,
      );
  String? get id => _id;
  String? get mailBoxNum => _mailBoxNum;
  String? get fname => _fname;
  String? get lname => _lname;
  String? get ids => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['mail_box_num'] = _mailBoxNum;
    map['fname'] = _fname;
    map['lname'] = _lname;
    map['id'] = _id;
    return map;
  }
}
