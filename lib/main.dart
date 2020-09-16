import 'package:flutter/material.dart';
import 'package:findthem/login_pages/login.dart';
import 'package:findthem/login_pages/register_consumer.dart';
import 'package:findthem/login_pages/poc.dart';
import 'package:findthem/login_pages/register_provider.dart';
import 'package:findthem/login_pages/forgot_password.dart';
import 'package:findthem/sidebar/sidebar_layout.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/login',
  routes: {
    '/poc' : (context) => PoC(),
    '/login' : (context) => Login(),
    '/registerB' : (context) => RegisterC(),
    '/registerS' : (context) => RegisterP(),
    '/forgotpassword' : (context) => ForgotPassword(),
    '/home': (context) => sidebar_layout(),
  },
));