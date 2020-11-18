import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:findthem/database/database.dart';

Future<List<Mark>> loadmarker(int id, double latitude, double longitude) async {
  SharedPreferences p = await SharedPreferences.getInstance();
  p.reload();

  try {
    var response = await http.post(
        'http://findthem-techmafia.herokuapp.com/buyermap/' +
            id.toString() +
            '/?format=json',
        body: {
          "latitude": latitude.toString(),
          "longitude": longitude.toString()
        }).timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      return null;
    }
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    List<Mark> markers = [];
    print(jsonData);
    for (var k in jsonData) {
      Mark marker = Mark(k['id'], k['latitude'], k['longitude']);
      markers.add(marker);
    }
    print("check2");
    return markers;
  } on TimeoutException catch (e) {
    return null;
  } on http.ClientException catch (e) {
    return null;
  } on SocketException catch (e) {
    return null;
  }
}

Future<List<Mark>> loadordermarker(double latitude, double longitude) async {
  SharedPreferences p = await SharedPreferences.getInstance();
  p.reload();
  var id = p.getInt("userid");
  print(id);
  try {
    var response = await http.post(
        'http://findthem-techmafia.herokuapp.com/sellermap/' +
            id.toString() +
            '/?format=json',
        body: {
          "latitude": latitude.toString(),
          "longitude": longitude.toString()
        }).timeout(const Duration(seconds: 30));
    print(response.bodyBytes);
    if (response.statusCode != 200) {
      return null;
    }
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    List<Mark> markers = [];
    print(jsonData);
    for (var k in jsonData) {
      Mark marker = Mark(k['id'], k['latitude'], k['longitude']);
      markers.add(marker);
    }
    return markers;
  } on TimeoutException catch (e) {
    return null;
  } on http.ClientException catch (e) {
    return null;
  } on SocketException catch (e) {
    return null;
  }
}
