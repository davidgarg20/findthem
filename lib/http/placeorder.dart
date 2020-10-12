import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> placeorder(int category, String detail, String sdetail,
    String glocation, double latitude, double longitude) async {
  SharedPreferences p = await SharedPreferences.getInstance();
  int userid = p.getInt("userid");
  p.reload();

  try {
    var response = await http.post(
        'http://findthem-techmafia.herokuapp.com/createorder/?format=json',
        body: {
          "userid": userid.toString(),
          "category": category.toString(),
          "sdetail": sdetail,
          "detail": detail,
          "glocation": glocation,
          "latitude": latitude.toString(),
          "longitude": longitude.toString()
        }).timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  } on TimeoutException catch (e) {
    return false;
  } on http.ClientException catch (e) {
    return false;
  } on SocketException catch (e) {
    return false;
  }
}
