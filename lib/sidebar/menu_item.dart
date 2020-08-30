import 'package:flutter/material.dart';

class menu_item extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onclick;

  const menu_item({Key key, this.icon, this.title, this.onclick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20,10,10,10),
        child: Row(
          children: <Widget>[

            Icon(icon,color: Colors.cyan,size: 30,),
            SizedBox( width: 30,),
            Text(title,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),

          ],
        ),
      ),
    );
  }
}
