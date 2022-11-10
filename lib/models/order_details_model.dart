class OrderDetail {
  bool? status;
  Order? order;

  OrderDetail({this.status, this.order});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
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
  String? pickupDate;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<Service>? service;
  Customer? customer;

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
      this.service,
      this.customer});

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
    if (json['service'] != null) {
      service = <Service>[];
      json['service'].forEach((v) {
        service!.add(new Service.fromJson(v));
      });
    }
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
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
    if (this.service != null) {
      data['service'] = this.service!.map((v) => v.toJson()).toList();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Service {
  int? id;
  String? name;
  int? serviceNumber;
  int? customerId;
  int? organizationId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  List<ValetOrderItem>? valetOrderItem;

  Service(
      {this.id,
      this.name,
      this.serviceNumber,
      this.customerId,
      this.organizationId,
      this.createdAt,
      this.updatedAt,
      this.pivot,
      this.valetOrderItem});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    serviceNumber = json['service_number'];
    customerId = json['customer_id'];
    organizationId = json['organization_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    if (json['valet_order_item'] != null) {
      valetOrderItem = <ValetOrderItem>[];
      json['valet_order_item'].forEach((v) {
        valetOrderItem!.add(new ValetOrderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['service_number'] = this.serviceNumber;
    data['customer_id'] = this.customerId;
    data['organization_id'] = this.organizationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.valetOrderItem != null) {
      data['valet_order_item'] =
          this.valetOrderItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  int? orderId;
  int? serviceId;

  Pivot({this.orderId, this.serviceId});

  Pivot.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    serviceId = json['service_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['service_id'] = this.serviceId;
    return data;
  }
}

class ValetOrderItem {
  int? id;
  String? name;
  int? itemNumber;
  int? customerId;
  int? organizationId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? price;
  int? quantity;
  int? orderItemId;
  Pivot? pivot;

  ValetOrderItem(
      {this.id,
      this.name,
      this.itemNumber,
      this.customerId,
      this.organizationId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.price,
      this.quantity,
      this.orderItemId,
      this.pivot});

  ValetOrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    itemNumber = json['item_number'];
    customerId = json['customer_id'];
    organizationId = json['organization_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    price = json['price'];
    quantity = json['quantity'];
    orderItemId = json['order_item_id'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['item_number'] = this.itemNumber;
    data['customer_id'] = this.customerId;
    data['organization_id'] = this.organizationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['order_item_id'] = this.orderItemId;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivots {
  int? serviceId;
  int? itemId;

  Pivots({this.serviceId, this.itemId});

  Pivots.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    itemId = json['item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['item_id'] = this.itemId;
    return data;
  }
}

class Customer {
  int? id;
  Null? groupId;
  String? customerNumber;
  String? name;
  String? glCode;
  String? email;
  int? sendEmail;
  String? image;
  int? failedSms;
  String? specialCogPriceLabel;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? organizationId;
  int? customerType;
  String? contractExpiryDate;
  int? itemOrder;
  int? itemOrder2;
  int? billingProcedure;
  int? billingPeriod;
  String? specialCogPrice;
  String? customPrice;
  String? rewashPriceByWeight;
  String? stainsPriceByWeight;
  int? billingType;
  CustomerAddress? customerAddress;

  Customer(
      {this.id,
      this.groupId,
      this.customerNumber,
      this.name,
      this.glCode,
      this.email,
      this.sendEmail,
      this.image,
      this.failedSms,
      this.specialCogPriceLabel,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.organizationId,
      this.customerType,
      this.contractExpiryDate,
      this.itemOrder,
      this.itemOrder2,
      this.billingProcedure,
      this.billingPeriod,
      this.specialCogPrice,
      this.customPrice,
      this.rewashPriceByWeight,
      this.stainsPriceByWeight,
      this.billingType,
      this.customerAddress});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    customerNumber = json['customer_number'];
    name = json['name'];
    glCode = json['gl_code'];
    email = json['email'];
    sendEmail = json['send_email'];
    image = json['image'];
    failedSms = json['failed_sms'];
    specialCogPriceLabel = json['special_cog_price_label'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    organizationId = json['organization_id'];
    customerType = json['customer_type'];
    contractExpiryDate = json['contract_expiry_date'];
    itemOrder = json['item_order'];
    itemOrder2 = json['item_order2'];
    billingProcedure = json['billing_procedure'];
    billingPeriod = json['billing_period'];
    specialCogPrice = json['special_cog_price'];
    customPrice = json['custom_price'];
    rewashPriceByWeight = json['rewash_price_by_weight'];
    stainsPriceByWeight = json['stains_price_by_weight'];
    billingType = json['billing_type'];
    customerAddress = json['customer_address'] != null
        ? new CustomerAddress.fromJson(json['customer_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['customer_number'] = this.customerNumber;
    data['name'] = this.name;
    data['gl_code'] = this.glCode;
    data['email'] = this.email;
    data['send_email'] = this.sendEmail;
    data['image'] = this.image;
    data['failed_sms'] = this.failedSms;
    data['special_cog_price_label'] = this.specialCogPriceLabel;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['organization_id'] = this.organizationId;
    data['customer_type'] = this.customerType;
    data['contract_expiry_date'] = this.contractExpiryDate;
    data['item_order'] = this.itemOrder;
    data['item_order2'] = this.itemOrder2;
    data['billing_procedure'] = this.billingProcedure;
    data['billing_period'] = this.billingPeriod;
    data['special_cog_price'] = this.specialCogPrice;
    data['custom_price'] = this.customPrice;
    data['rewash_price_by_weight'] = this.rewashPriceByWeight;
    data['stains_price_by_weight'] = this.stainsPriceByWeight;
    data['billing_type'] = this.billingType;
    if (this.customerAddress != null) {
      data['customer_address'] = this.customerAddress!.toJson();
    }
    return data;
  }
}

class CustomerAddress {
  int? customerId;
  String? shippingAddress;
  String? shippingCity;
  String? shippingState;
  String? country;
  String? shippingZipcode;
  String? shippingPhone;
  String? shippingFax;

  CustomerAddress(
      {this.customerId,
      this.shippingAddress,
      this.shippingCity,
      this.shippingState,
      this.country,
      this.shippingZipcode,
      this.shippingPhone,
      this.shippingFax});

  CustomerAddress.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    shippingAddress = json['shipping_address'];
    shippingCity = json['shipping_city'];
    shippingState = json['shipping_state'];
    country = json['country'];
    shippingZipcode = json['shipping_zipcode'];
    shippingPhone = json['shipping_phone'];
    shippingFax = json['shipping_fax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['shipping_address'] = this.shippingAddress;
    data['shipping_city'] = this.shippingCity;
    data['shipping_state'] = this.shippingState;
    data['country'] = this.country;
    data['shipping_zipcode'] = this.shippingZipcode;
    data['shipping_phone'] = this.shippingPhone;
    data['shipping_fax'] = this.shippingFax;
    return data;
  }
}