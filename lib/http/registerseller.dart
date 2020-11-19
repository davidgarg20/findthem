import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> registerSeller(
    String name,
    String sellercategory,
    String jobdescription,
    String address,
    String city,
    String state,
    String pincode,
    String phoneno,
    String email,
    String password,
    String confirmpassword) async {
  SharedPreferences p = await SharedPreferences.getInstance();
  p.reload();
  if (password != confirmpassword)
    return "Password and Confirm Password don't match";
  if (name == "") return "Name is Required";
  if (jobdescription == "") return "Job Description is Required";
  if (address == "") return "Address is Required";
  if (city == "") return "City is Required";
  if (state == "") return "State is Required";
  if (pincode == "") return "PinCode is Required";
  if (phoneno == "") return "MobileNo. is Required";
  if (email == "") return "Email is Required";
  if (password == "") return "Password is Required";
  if (phoneno.length != 10) return "Invalid MobileNo.";

  var category = 0;
  if (sellercategory == "RaddiWala")
    category = 1;
  else if (sellercategory == "Tailor")
    category = 2;
  else if (sellercategory == "Building Contractor") category = 3;
  try {
    var response = await http.post(
        'http://findthem-techmafia.herokuapp.com/registerseller/?format=json',
        body: {
          "name": name,
          "sellercategory": category.toString(),
          "jobdescription": jobdescription,
          "address": address,
          "city": city,
          "state": state,
          "pincode": pincode,
          "phoneno": phoneno,
          "email": email,
          "password": password
        }).timeout(const Duration(seconds: 30));
    print(response.body);
    if (response.statusCode != 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      var t = jsonData['email'][0];
      return t;
    }
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    p.setBool("loginseller", true);
    p.setInt("userid", jsonData['sellerid']);
    p.setString("email", email);
    p.setString("name", name);
    return "Registration Sucessfull";
  } on TimeoutException catch (e) {
    return "No Internet";
  } on http.ClientException catch (e) {
    return "No Internet";
  } on SocketException catch (e) {
    return "No Internet";
  }
}
