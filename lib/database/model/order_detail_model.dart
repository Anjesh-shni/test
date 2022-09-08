// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromMap(jsonString);

import 'dart:convert';

OrderDetailModel orderDetailModelFromMap(String str) =>
    OrderDetailModel.fromMap(json.decode(str));

String orderDetailModelToMap(OrderDetailModel data) =>
    json.encode(data.toMap());

class OrderDetailModel {
  OrderDetailModel({
    this.data,
  });

  OrderDetailModelData? data;

  factory OrderDetailModel.fromMap(Map<String, dynamic> json) =>
      OrderDetailModel(
        data: OrderDetailModelData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data!.toMap(),
      };
}

class OrderDetailModelData {
  OrderDetailModelData({
    this.status,
    this.data,
  });

  int? status;
  OrderShowData? data;

  factory OrderDetailModelData.fromMap(Map<String, dynamic> json) =>
      OrderDetailModelData(
        status: json["status"],
        data: OrderShowData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data!.toMap(),
      };
}

class OrderShowData {
  OrderShowData({
    this.id,
    this.orderId,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.timeFormat,
    this.date,
    this.tableName,
    this.order,
  });

  int? id;
  String? orderId;
  String? total;
  String? createdAt;
  String? updatedAt;
  String? timeFormat;
  String? date;
  String? tableName;
  Order? order;

  factory OrderShowData.fromMap(Map<String, dynamic> json) => OrderShowData(
        id: json["id"],
        orderId: json["order_id"],
        total: json["total"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        timeFormat: json["time_format"],
        date: json["date"],
        tableName: json["table_name"],
        order: Order.fromMap(json["order"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_id": orderId,
        "total": total,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "time_format": timeFormat,
        "date": date,
        "table_name": tableName,
        "order": order!.toMap(),
      };
}

class Order {
  Order({
    this.id,
    this.total,
    this.subTotal,
    this.status,
    this.statusName,
    this.paymentStatus,
    this.paymentMethod,
    this.paymentMethodName,
    this.paidAmount,
    this.restaurantId,
    this.restaurantName,
    this.items,
  });

  int? id;
  String? total;
  String? subTotal;
  int? status;
  String? statusName;
  int? paymentStatus;
  int? paymentMethod;
  String? paymentMethodName;
  String? paidAmount;
  int? restaurantId;
  String? restaurantName;
  List<Item>? items;

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"],
        total: json["total"],
        subTotal: json["sub_total"],
        status: json["status"],
        statusName: json["status_name"],
        paymentStatus: json["payment_status"],
        paymentMethod: json["payment_method"],
        paymentMethodName: json["payment_method_name"],
        paidAmount: json["paid_amount"],
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "total": total,
        "sub_total": subTotal,
        "status": status,
        "status_name": statusName,
        "payment_status": paymentStatus,
        "payment_method": paymentMethod,
        "payment_method_name": paymentMethodName,
        "paid_amount": paidAmount,
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "items": List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Item {
  Item({
    this.id,
    this.orderId,
    this.restaurantId,
    this.menuItemId,
    this.menuItemName,
    this.menuItemNumber,
    this.menuItemImage,
    this.quantity,
    this.unitPrice,
    this.discountedPrice,
    this.itemTotal,
    this.createdAt,
    this.updatedAt,
    this.menuItemVariation,
    this.options,
    this.optionTotal,
  });

  int? id;
  int? orderId;
  int? restaurantId;
  int? menuItemId;
  String? menuItemName;
  String? menuItemNumber;
  String? menuItemImage;
  int? quantity;
  String? unitPrice;
  String? discountedPrice;
  String? itemTotal;
  String? createdAt;
  String? updatedAt;
  Unit? menuItemVariation;
  List<Unit>? options;
  int? optionTotal;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        orderId: json["order_id"],
        restaurantId: json["restaurant_id"],
        menuItemId: json["menu_item_id"],
        menuItemName: json["menu_item_name"],
        menuItemNumber: json["menu_item_number"],
        menuItemImage: json["menu_item_image"],
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        discountedPrice: json["discounted_price"],
        itemTotal: json["item_total"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        menuItemVariation: Unit.fromMap(json["menu_item_variation"]),
        options: List<Unit>.from(json["options"].map((x) => Unit.fromMap(x))),
        optionTotal: json["option_total"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_id": orderId,
        "restaurant_id": restaurantId,
        "menu_item_id": menuItemId,
        "menu_item_name": menuItemName,
        "menu_item_number": menuItemNumber,
        "menu_item_image": menuItemImage,
        "quantity": quantity,
        "unit_price": unitPrice,
        "discounted_price": discountedPrice,
        "item_total": itemTotal,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "menu_item_variation": menuItemVariation!.toMap(),
        "options": List<dynamic>.from(options!.map((x) => x.toMap())),
        "option_total": optionTotal,
      };
}

class Unit {
  Unit({
    this.id,
    this.name,
    this.unitPrice,
    this.currencyCode,
    this.discountPrice,
  });

  int? id;
  String? name;
  String? unitPrice;
  String? currencyCode;
  String? discountPrice;

  factory Unit.fromMap(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
        unitPrice: json["unit_price"],
        currencyCode: json["currency_code"],
        discountPrice: json["discount_price"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "unit_price": unitPrice,
        "currency_code": currencyCode,
        "discount_price": discountPrice,
      };
}
