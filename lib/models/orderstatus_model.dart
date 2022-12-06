class OrderStatusCheck {
  bool? status;
  Data? data;

  OrderStatusCheck({this.status, this.data});

  OrderStatusCheck.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? message;
  String? orderStatus;

  Data({this.message, this.orderStatus});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    orderStatus = json['order_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['order_status'] = this.orderStatus;
    return data;
  }
}