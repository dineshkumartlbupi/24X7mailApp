import '../models/customerMailModel.dart';

class StatementReportModel {
  StatementReportModel({
    bool? status,
    List<Data>? data,
  }) {
    _status = status;
    _data = data;
  }

  StatementReportModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  List<Data>? _data;
  StatementReportModel copyWith({
    bool? status,
    List<Data>? data,
  }) =>
      StatementReportModel(
        status: status ?? _status,
        data: data ?? _data,
      );
  bool? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    String? id,
    int? totalUser,
    String? date,
    int? revenue,
    int? licenceFee,
    int? storedPayout,
    List<String>? featureId,
    List<int>? operatorTotalUser,
    List<dynamic>? operatorTotalRevenue,
    List<dynamic>? operatorTotalLicenceFee,
    List<dynamic>? operatorTotalStoredPayout,
    int? v,
  }) {
    _id = id;
    _totalUser = totalUser;
    _date = date;
    _revenue = revenue;
    _licenceFee = licenceFee;
    _storedPayout = storedPayout;
    _featureId = featureId;
    _operatorTotalUser = operatorTotalUser;
    _operatorTotalRevenue = operatorTotalRevenue;
    _operatorTotalLicenceFee = operatorTotalLicenceFee;
    _operatorTotalStoredPayout = operatorTotalStoredPayout;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _totalUser = json['total_user'];
    _date = json['date'];
    _revenue = json['revenue'];
    _licenceFee = json['licence_fee'];
    _storedPayout = json['stored_payout'];
    _featureId =
        json['feature_id'] != null ? json['feature_id'].cast<String>() : [];
    _operatorTotalUser = json['operator_total_user'] != null
        ? json['operator_total_user'].cast<int>()
        : [];
    if (json['operator_total_revenue'] != null) {
      _operatorTotalRevenue = [];
      json['operator_total_revenue'].forEach((v) {
        _operatorTotalRevenue?.add(Dynamic.fromJson(v));
      });
    }
    if (json['operator_total_licence_fee'] != null) {
      _operatorTotalLicenceFee = [];
      json['operator_total_licence_fee'].forEach((v) {
        _operatorTotalLicenceFee?.add(Dynamic.fromJson(v));
      });
    }
    if (json['operator_total_stored_payout'] != null) {
      _operatorTotalStoredPayout = [];
      json['operator_total_stored_payout'].forEach((v) {
        _operatorTotalStoredPayout?.add(Dynamic.fromJson(v));
      });
    }
    _v = json['__v'];
  }
  String? _id;
  int? _totalUser;
  String? _date;
  int? _revenue;
  int? _licenceFee;
  int? _storedPayout;
  List<String>? _featureId;
  List<int>? _operatorTotalUser;
  List<dynamic>? _operatorTotalRevenue;
  List<dynamic>? _operatorTotalLicenceFee;
  List<dynamic>? _operatorTotalStoredPayout;
  int? _v;
  Data copyWith({
    String? id,
    int? totalUser,
    String? date,
    int? revenue,
    int? licenceFee,
    int? storedPayout,
    List<String>? featureId,
    List<int>? operatorTotalUser,
    List<dynamic>? operatorTotalRevenue,
    List<dynamic>? operatorTotalLicenceFee,
    List<dynamic>? operatorTotalStoredPayout,
    int? v,
  }) =>
      Data(
        id: id ?? _id,
        totalUser: totalUser ?? _totalUser,
        date: date ?? _date,
        revenue: revenue ?? _revenue,
        licenceFee: licenceFee ?? _licenceFee,
        storedPayout: storedPayout ?? _storedPayout,
        featureId: featureId ?? _featureId,
        operatorTotalUser: operatorTotalUser ?? _operatorTotalUser,
        operatorTotalRevenue: operatorTotalRevenue ?? _operatorTotalRevenue,
        operatorTotalLicenceFee:
            operatorTotalLicenceFee ?? _operatorTotalLicenceFee,
        operatorTotalStoredPayout:
            operatorTotalStoredPayout ?? _operatorTotalStoredPayout,
        v: v ?? _v,
      );
  String? get id => _id;
  int? get totalUser => _totalUser;
  String? get date => _date;
  int? get revenue => _revenue;
  int? get licenceFee => _licenceFee;
  int? get storedPayout => _storedPayout;
  List<String>? get featureId => _featureId;
  List<int>? get operatorTotalUser => _operatorTotalUser;
  List<dynamic>? get operatorTotalRevenue => _operatorTotalRevenue;
  List<dynamic>? get operatorTotalLicenceFee => _operatorTotalLicenceFee;
  List<dynamic>? get operatorTotalStoredPayout => _operatorTotalStoredPayout;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['total_user'] = _totalUser;
    map['date'] = _date;
    map['revenue'] = _revenue;
    map['licence_fee'] = _licenceFee;
    map['stored_payout'] = _storedPayout;
    map['feature_id'] = _featureId;
    map['operator_total_user'] = _operatorTotalUser;
    if (_operatorTotalRevenue != null) {
      map['operator_total_revenue'] =
          _operatorTotalRevenue?.map((v) => v.toJson()).toList();
    }
    if (_operatorTotalLicenceFee != null) {
      map['operator_total_licence_fee'] =
          _operatorTotalLicenceFee?.map((v) => v.toJson()).toList();
    }
    if (_operatorTotalStoredPayout != null) {
      map['operator_total_stored_payout'] =
          _operatorTotalStoredPayout?.map((v) => v.toJson()).toList();
    }
    map['__v'] = _v;
    return map;
  }
}
