class Orderlist {
  bool? status;
  List<Order>? order;

  Orderlist({this.status, this.order});

  Orderlist.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['order'] != null) {
      order = <Order>[];
      json['order'].forEach((v) {
        order!.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.order != null) {
      data['order'] = this.order!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  int? id;
  String? name;
  String? referenceNumber;
  int? customerId;
  int? organizationId;
  String? email;
  String? roomNumber;
  String? phone;
  String? orderDate;
 

  int? status;
  String? createdAt;
  String? updatedAt;

  String? customerName;
  
 
  Order(
      {this.id,
      this.name,
      this.referenceNumber,
      this.customerId,
      this.organizationId,
      this.email,
      this.roomNumber,
      this.phone,
      this.orderDate,
 
      this.status,
      this.createdAt,
      this.updatedAt,
      this.customerName,
     });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    referenceNumber = json['reference_number'];
    customerId = json['customer_id'];
    organizationId = json['organization_id'];
    email = json['email'];
    roomNumber = json['room_number'];
    phone = json['phone'];
    orderDate = json['order_date'];


    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    customerName = json['customer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['reference_number'] = this.referenceNumber;
    data['customer_id'] = this.customerId;
    data['organization_id'] = this.organizationId;
    data['email'] = this.email;
    data['room_number'] = this.roomNumber;
    data['phone'] = this.phone;
    data['order_date'] = this.orderDate;
   

    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    data['customer_name'] = this.customerName;
    return data;
  }
}
/*
  int? id;
  String? name;
  String? referenceNumber;
  int? customerId;
  int? organizationId;
  String? email;
  String? roomNumber;
  String? phone;
  String? orderDate;
  Null? pickupDate;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? customerName;

  Order(
      {this.id,
      this.name,
      this.referenceNumber,
      this.customerId,
      this.organizationId,
      this.email,
      this.roomNumber,
      this.phone,
      this.orderDate,
      this.pickupDate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.customerName});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    referenceNumber = json['reference_number'];
    customerId = json['customer_id'];
    organizationId = json['organization_id'];
    email = json['email'];
    roomNumber = json['room_number'];
    phone = json['phone'];
    orderDate = json['order_date'];
    pickupDate = json['pickup_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    customerName = json['customer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['reference_number'] = this.referenceNumber;
    data['customer_id'] = this.customerId;
    data['organization_id'] = this.organizationId;
    data['email'] = this.email;
    data['room_number'] = this.roomNumber;
    data['phone'] = this.phone;
    data['order_date'] = this.orderDate;
    data['pickup_date'] = this.pickupDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['customer_name'] = this.customerName;
    return data;
  }
}









*/