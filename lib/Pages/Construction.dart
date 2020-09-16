import 'package:flutter/material.dart';
import '../navigation_bloc/navigation_bloc.dart';

class Construction extends StatelessWidget with NaviagtionStates 
{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Labour")),backgroundColor: Colors.deepOrange,),
      body: Container( color: Colors.pink,
        child: Column(children: <Widget>[Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child:Text(" Details ",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 32),)),
        ),Image.asset("./assets/images/labour.png",height: height*0.5,),
          Text("Describe your requirement"),
          Padding( padding: EdgeInsets.fromLTRB(20,10,20,10), child:Container(child: TextField() , decoration: BoxDecoration(shape:BoxShape.rectangle, border:Border.all(width: 2.0),borderRadius: BorderRadius.circular(5.0)), )),
          RaisedButton(child: Text("Continue"),color: Colors.yellow,),
        ],),
      )
    );
  }
}
