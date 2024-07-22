class StatementModell {
  bool? status;
  String? msg;
  List<Data>? data;

  StatementModell({this.status, this.msg, this.data});

  StatementModell.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  PlanId? planId;
  dynamic planDetail; // Note: planDetail can be String or Map
  String? amount;
  String? paymentMode;
  String? description;
  int? paymentStatus;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({
    this.id,
    this.userId,
    this.planId,
    this.planDetail,
    this.amount,
    this.paymentMode,
    this.description,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['user_id'];
    planId = json['plan_id'] != null ? PlanId.fromJson(json['plan_id']) : null;
    planDetail = json['plan_detail'];
    amount = json['amount'];
    paymentMode = json['payment_mode'];
    description = json['description'];
    paymentStatus = json['payment_status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['user_id'] = userId;
    if (planId != null) {
      data['plan_id'] = planId?.toJson();
    }
    data['plan_detail'] = planDetail;
    data['amount'] = amount;
    data['payment_mode'] = paymentMode;
    data['description'] = description;
    data['payment_status'] = paymentStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}

class PlanId {
  String? id;
  String? type;

  PlanId({this.id, this.type});

  PlanId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['type'] = type;
    return data;
  }
}
