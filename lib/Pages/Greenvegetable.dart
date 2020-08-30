import 'package:flutter/material.dart';
import '../navigation_bloc/navigation_bloc.dart';

class Greenvegetable extends StatelessWidget with NaviagtionStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Green_Vegetable",
          style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),),
      ),
    );
  }
}
