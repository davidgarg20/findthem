

import 'package:flutter/material.dart';
import '../navigation_bloc/navigation_bloc.dart';

class Greenvegetable extends StatelessWidget with NaviagtionStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Groceries")),backgroundColor: Color.fromRGBO(53, 115, 73, 1),),
      body: Container( color: Colors.green,
        child: Column(children: <Widget>[Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child:Text("Order Details",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 32),)),
        ),Image.asset("./assets/images/groceries.jpg"),
          Text("Describe your requirement"),
          Padding( padding: EdgeInsets.fromLTRB(20,10,20,10), child:Container(child: TextField() , decoration: BoxDecoration(shape:BoxShape.rectangle, border:Border.all(width: 2.0),borderRadius: BorderRadius.circular(5.0)), )),
          
          RaisedButton(child: Text("Continue"),color: Colors.yellow,),
        ],),
      )
    );
  }
}
