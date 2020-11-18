import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:findthem/database/database.dart';

Future<Order> loadorder(int id) async {
  try {
    var response = await http
        .get(
          'http://findthem-techmafia.herokuapp.com/order/' +
              id.toString() +
              '/?format=json',
        )
        .timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      return null;
    }
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    print(jsonData);
    String category = "Vegetables";
    if (jsonData['category'] == 1)
      category = "RaddiWala";
    else if (jsonData['category'] == 1)
      category = "Tailor";
    else if (jsonData['category'] == 1) category = "Building Contractor";
    Order order = Order(
        jsonData['id'],
        jsonData['userid'],
        category,
        jsonData['sdetail'],
        jsonData['detail'],
        jsonData['glocation'],
        jsonData['latitude'],
        jsonData['longitude'],
        jsonData['orderaccepted'],
        jsonData['ordercompleted'],
        jsonData['seller']);
    return order;
  } on TimeoutException catch (e) {
    return null;
  } on http.ClientException catch (e) {
    return null;
  } on SocketException catch (e) {
    return null;
  }
}

Future<Buyer> loadbuyer(int id) async {
  try {
    var response = await http
        .get(
          'http://findthem-techmafia.herokuapp.com/buyerdetail/' +
              id.toString() +
              '/?format=json',
        )
        .timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      return null;
    }
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    print(jsonData);
    Buyer buyer = Buyer(
      jsonData['id'],
      jsonData['name'],
      jsonData['phoneno'],
    );
    return buyer;
  } on TimeoutException catch (e) {
    return null;
  } on http.ClientException catch (e) {
    return null;
  } on SocketException catch (e) {
    return null;
  }
}

Future<List<Order>> loadorders() async {
  var prefs = await SharedPreferences.getInstance();
  var id = prefs.get("userid");
  try {
    var response = await http
        .get(
          'http://findthem-techmafia.herokuapp.com/listorder/' +
              id.toString() +
              '/?format=json',
        )
        .timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      return null;
    }
    List<Order> orders = [];
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    print(jsonData);
    for (var k in jsonData) {
      String category = "Vegetables";
      if (k['category'] == 1)
        category = "RaddiWala";
      else if (k['category'] == 1)
        category = "Tailor";
      else if (k['category'] == 1) category = "Building Contractor";
      Order order = Order(
          k['id'],
          k['userid'],
          category,
          k['sdetail'],
          k['detail'],
          k['glocation'],
          k['latitude'],
          k['longitude'],
          k['orderaccepted'],
          k['ordercompleted'],
          k['seller']);
      orders.add(order);
    }
    return orders;
  } on TimeoutException catch (e) {
    return null;
  } on http.ClientException catch (e) {
    return null;
  } on SocketException catch (e) {
    return null;
  }
}

Future<List<Order>> loadsellerorders() async {
  var prefs = await SharedPreferences.getInstance();
  var id = prefs.get("userid");
  try {
    var response = await http
        .get(
          'http://findthem-techmafia.herokuapp.com/listsellerorders/' +
              id.toString() +
              '/?format=json',
        )
        .timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      return null;
    }
    List<Order> orders = [];
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    print(jsonData);
    for (var k in jsonData) {
      String category = "Vegetables";
      if (k['category'] == 1)
        category = "RaddiWala";
      else if (k['category'] == 1)
        category = "Tailor";
      else if (k['category'] == 1) category = "Building Contractor";
      Order order = Order(
          k['id'],
          k['userid'],
          category,
          k['sdetail'],
          k['detail'],
          k['glocation'],
          k['latitude'],
          k['longitude'],
          k['orderaccepted'],
          k['ordercompleted'],
          k['seller']);
      orders.add(order);
    }
    return orders;
  } on TimeoutException catch (e) {
    return null;
  } on http.ClientException catch (e) {
    return null;
  } on SocketException catch (e) {
    return null;
  }
}

Future<bool> orderaccept(String id) async {
  SharedPreferences p = await SharedPreferences.getInstance();
  p.reload();
  var sellerid = p.getInt('userid');
  print(sellerid);
  try {
    var response = await http.put(
        'http://findthem-techmafia.herokuapp.com/orderaccept/' +
            id.toString() +
            '/?format=json',
        body: {
          'orderaccepted': "1",
          'seller': sellerid.toString(),
        }).timeout(const Duration(seconds: 30));

    print(response.bodyBytes);
    if (response.statusCode != 200) {
      print(id);
      return true;
    }

    return false;
  } on TimeoutException catch (e) {
    return false;
  } on http.ClientException catch (e) {
    return false;
  } on SocketException catch (e) {
    return false;
  }
}

Future<bool> ordercompleted(String id) async {
  SharedPreferences p = await SharedPreferences.getInstance();
  p.reload();
  var sellerid = p.getInt('userid');
  try {
    var response = await http.put(
        'http://findthem-techmafia.herokuapp.com/ordercompleted/' +
            id +
            '/?format=json',
        body: {
          'ordercompleted': "1",
        }).timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      return true;
    }

    return false;
  } on TimeoutException catch (e) {
    return false;
  } on http.ClientException catch (e) {
    return false;
  } on SocketException catch (e) {
    return false;
  }
}
