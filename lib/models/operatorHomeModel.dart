class OperatorHomeModel {
  OperatorHomeModel({
    bool? status,
    String? msg,
    Data? data,
  }) {
    _status = status;
    _msg = msg;
    _data = data;
  }

  OperatorHomeModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _msg;
  Data? _data;
  OperatorHomeModel copyWith({
    bool? status,
    String? msg,
    Data? data,
  }) =>
      OperatorHomeModel(
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
    int? scanRequest,
    int? rescanRequest,
    int? shredRequest,
    int? recycleRequest,
    int? forwardShipment,
    int? localPickupRequest,
  }) {
    _scanRequest = scanRequest;
    _rescanRequest = rescanRequest;
    _shredRequest = shredRequest;
    _recycleRequest = recycleRequest;
    _forwardShipment = forwardShipment;
    _localPickupRequest = localPickupRequest;
  }

  Data.fromJson(dynamic json) {
    _scanRequest = json['scan_request'];
    _rescanRequest = json['rescan_request'];
    _shredRequest = json['shred_request'];
    _recycleRequest = json['recycle_request'];
    _forwardShipment = json['forward_shipment'];
    _localPickupRequest = json['local_pickup_request'];
  }
  int? _scanRequest;
  int? _rescanRequest;
  int? _shredRequest;
  int? _recycleRequest;
  int? _forwardShipment;
  int? _localPickupRequest;
  Data copyWith({
    int? scanRequest,
    int? rescanRequest,
    int? shredRequest,
    int? recycleRequest,
    int? forwardShipment,
    int? localPickupRequest,
  }) =>
      Data(
        scanRequest: scanRequest ?? _scanRequest,
        rescanRequest: rescanRequest ?? _rescanRequest,
        shredRequest: shredRequest ?? _shredRequest,
        recycleRequest: recycleRequest ?? _recycleRequest,
        forwardShipment: forwardShipment ?? _forwardShipment,
        localPickupRequest: localPickupRequest ?? _localPickupRequest,
      );
  int? get scanRequest => _scanRequest;
  int? get rescanRequest => _rescanRequest;
  int? get shredRequest => _shredRequest;
  int? get recycleRequest => _recycleRequest;
  int? get forwardShipment => _forwardShipment;
  int? get localPickupRequest => _localPickupRequest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scan_request'] = _scanRequest;
    map['rescan_request'] = _rescanRequest;
    map['shred_request'] = _shredRequest;
    map['recycle_request'] = _recycleRequest;
    map['forward_shipment'] = _forwardShipment;
    map['local_pickup_request'] = _localPickupRequest;
    return map;
  }
}
