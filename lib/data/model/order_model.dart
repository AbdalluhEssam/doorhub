class OrderModel {
  String? orderId;
  String? usersId;
  String? delivery;
  String? totalPrice;
  String? ordersAddressid;
  String? ordersCoupon;
  String? orderDate;
  String? orderApprove;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCityid;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrderModel(
      {this.orderId,
        this.usersId,
        this.delivery,
        this.totalPrice,
        this.ordersAddressid,
        this.ordersCoupon,
        this.orderDate,
        this.orderApprove,
        this.addressId,
        this.addressUsersid,
        this.addressName,
        this.addressCityid,
        this.addressStreet,
        this.addressLat,
        this.addressLong});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'].toString();
    usersId = json['users_id'].toString();
    delivery = json['delivery'].toString();
    totalPrice = json['total_price'].toString();
    ordersAddressid = json['orders_addressid'].toString();
    ordersCoupon = json['orders_coupon'].toString();
    orderDate = json['order_date'].toString();
    orderApprove = json['order_approve'].toString();
    addressId = json['address_id'].toString();
    addressUsersid = json['address_usersid'].toString();
    addressName = json['address_name'].toString();
    addressCityid = json['address_cityid'].toString();
    addressStreet = json['address_street'].toString();
    addressLat = json['address_lat'].toString();
    addressLong = json['address_long'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['users_id'] = this.usersId;
    data['delivery'] = this.delivery;
    data['total_price'] = this.totalPrice;
    data['orders_addressid'] = this.ordersAddressid;
    data['orders_coupon'] = this.ordersCoupon;
    data['order_date'] = this.orderDate;
    data['order_approve'] = this.orderApprove;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_cityid'] = this.addressCityid;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
