
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sidebar/sidebar_layout.dart';

void main() => runApp(MaterialApp(
    home : test(),
    ));

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home: sidebar_layout() ,
    );
  }
}
