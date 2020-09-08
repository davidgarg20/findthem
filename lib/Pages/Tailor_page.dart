import 'package:flutter/material.dart';
import '../navigation_bloc/navigation_bloc.dart';

class Tailor extends StatelessWidget with NaviagtionStates{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Tailor",
          style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),),
      ),
    );
  }
}
