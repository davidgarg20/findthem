class Mark {
  int id;
  double latitude;
  double longitude;

  Mark(this.id, this.latitude, this.longitude);

  Map<String, dynamic> toMap() {
    return {'id': id, 'latitude': latitude, 'longitude': longitude};
  }
}

class Order {
  int id;
  int userid;
  String category;
  String sdetail;
  String detail;
  String glocation;
  double latitude;
  double longitude;
  bool orderaccepted;
  bool ordercompleted;
  int seller;

  Order(
      this.id,
      this.userid,
      this.category,
      this.sdetail,
      this.detail,
      this.glocation,
      this.latitude,
      this.longitude,
      this.orderaccepted,
      this.ordercompleted,
      this.seller);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'sdetail': sdetail,
      'detail': detail,
      'glocation': glocation,
      'latitude': latitude,
      'longitude': longitude,
      'orderaccepted': orderaccepted,
      'ordercompleted': ordercompleted,
      'seller': seller
    };
  }
}

class Buyer {
  int id;
  String name;
  String phoneno;

  Buyer(this.id, this.name, this.phoneno);

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'phoneno': phoneno};
  }
}

class Seller {
  int id;
  String name;
  String phoneno;
  String address;
  String city;

  Seller(this.id, this.name, this.phoneno, this.address, this.city);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneno': phoneno,
      'address': address,
      'city': city
    };
  }
}
