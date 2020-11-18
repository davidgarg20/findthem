import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> login(String email, String password) async {
  SharedPreferences p = await SharedPreferences.getInstance();
  p.reload();

  try {
    var response = await http.post(
        'http://findthem-techmafia.herokuapp.com/login/?format=json',
        body: {
          "email": email,
          "password": password
        }).timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      return jsonData['message'];
    }
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    print("login");
    p.setBool("login", true);
    p.setInt("userid", jsonData['userid']);
    p.setString("email", email);
    p.setString("name", jsonData['name']);
    return "Login Sucessfull";
  } on TimeoutException catch (e) {
    return "No Internet";
  } on http.ClientException catch (e) {
    return "No Internet";
  } on SocketException catch (e) {
    return "No Internet";
  }
}

Future<String> loginseller(String email, String password) async {
  SharedPreferences p = await SharedPreferences.getInstance();
  p.reload();

  try {
    var response = await http.post(
        'http://findthem-techmafia.herokuapp.com/loginseller/?format=json',
        body: {
          "email": email,
          "password": password
        }).timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      return jsonData['message'];
    }
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    print("login");
    p.setBool("loginseller", true);
    p.setInt("userid", jsonData['userid']);
    p.setString("email", email);
    p.setString("name", jsonData['name']);
    return "Login Sucessfull";
  } on TimeoutException catch (e) {
    return "No Internet";
  } on http.ClientException catch (e) {
    return "No Internet";
  } on SocketException catch (e) {
    return "No Internet";
  }
}
