class OperatorOperationModel {
  OperatorOperationModel({
    bool? stauts,
    Data? data,
  }) {
    _stauts = stauts;
    _data = data;
  }

  OperatorOperationModel.fromJson(dynamic json) {
    _stauts = json['stauts'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _stauts;
  Data? _data;
  OperatorOperationModel copyWith({
    bool? stauts,
    Data? data,
  }) =>
      OperatorOperationModel(
        stauts: stauts ?? _stauts,
        data: data ?? _data,
      );
  bool? get stauts => _stauts;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stauts'] = _stauts;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    int? upload,
    int? assing,
    int? rescan,
    int? openScan,
    int? shipment,
    int? pickup,
    int? shred,
    int? isDelete,
    int? recycle,
    int? total,
  }) {
    _upload = upload;
    _assing = assing;
    _rescan = rescan;
    _openScan = openScan;
    _shipment = shipment;
    _pickup = pickup;
    _shred = shred;
    _isDelete = isDelete;
    _recycle = recycle;
    _total = total;
  }

  Data.fromJson(dynamic json) {
    _upload = json['upload'];
    _assing = json['assing'];
    _rescan = json['rescan'];
    _openScan = json['open_scan'];
    _shipment = json['shipment'];
    _pickup = json['pickup'];
    _shred = json['shred'];
    _isDelete = json['isDelete'];
    _recycle = json['recycle'];
    _total = json['total'];
  }
  int? _upload;
  int? _assing;
  int? _rescan;
  int? _openScan;
  int? _shipment;
  int? _pickup;
  int? _shred;
  int? _isDelete;
  int? _recycle;
  int? _total;
  Data copyWith({
    int? upload,
    int? assing,
    int? rescan,
    int? openScan,
    int? shipment,
    int? pickup,
    int? shred,
    int? isDelete,
    int? recycle,
    int? total,
  }) =>
      Data(
        upload: upload ?? _upload,
        assing: assing ?? _assing,
        rescan: rescan ?? _rescan,
        openScan: openScan ?? _openScan,
        shipment: shipment ?? _shipment,
        pickup: pickup ?? _pickup,
        shred: shred ?? _shred,
        isDelete: isDelete ?? _isDelete,
        recycle: recycle ?? _recycle,
        total: total ?? _total,
      );
  int? get upload => _upload;
  int? get assing => _assing;
  int? get rescan => _rescan;
  int? get openScan => _openScan;
  int? get shipment => _shipment;
  int? get pickup => _pickup;
  int? get shred => _shred;
  int? get isDelete => _isDelete;
  int? get recycle => _recycle;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['upload'] = _upload;
    map['assing'] = _assing;
    map['rescan'] = _rescan;
    map['open_scan'] = _openScan;
    map['shipment'] = _shipment;
    map['pickup'] = _pickup;
    map['shred'] = _shred;
    map['isDelete'] = _isDelete;
    map['recycle'] = _recycle;
    map['total'] = _total;
    return map;
  }
}
