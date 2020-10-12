import 'package:flutter/material.dart';
import '../navigation_bloc/navigation_bloc.dart';
import 'package:findthem/map.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget with NaviagtionStates {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Logout Succesfull"),
    );
  }
}
