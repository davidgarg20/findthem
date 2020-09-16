import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' ;
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


Future<String> registerBuyer(String name,String address, String city, String state, String phoneno, String email, String password, String confirmpassword) async {
  SharedPreferences p = await SharedPreferences.getInstance();
  p.reload();
  if(password!=confirmpassword)
  return "Password and Confirm Password don't match";
  if(name=="")
  return "Name is Required";
  if(address=="")
  return "Address is Required";
  if(city=="")
  return "City is Required";
  if(state=="")
  return "State is Required";
  if(phoneno=="")
  return "PhoneNo. is Required";
  if(email=="")
  return "Email is Required";
  if(password=="")
  return "Password is Required";

  try {
      var response = await http.post('http://findthem-techmafia.herokuapp.com/registerbuyer/?format=json',   body: { "name" : name,"address": address, "city":city,"state":state, "phoneno":phoneno, "email":email,  "password": password })
          .timeout(const Duration(seconds: 30));
          print(response.body);
     if(response.statusCode!=200)
     {  var jsonData = json.decode(utf8.decode(response.bodyBytes)); var t = jsonData['message'][0]; if(t==null) t=jsonData['email'][0]; return t; }
     var jsonData = json.decode(utf8.decode(response.bodyBytes));
     p.setString("userid",jsonData['userid']);
    return "Registration Sucessfull" ;
  }
  on TimeoutException catch( e ) {

    return "No Internet";

  }
  on http.ClientException catch( e ) {
    return "No Internet";
  }
  on SocketException catch(e) {
    return "No Internet";
  }
}