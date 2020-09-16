import 'package:flutter/material.dart';

class PoC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'How would you like to sign in:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  height: 50,
                  width: 400,
                  color: Colors.blue[50],
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/registerB');
                      },
                      child: Center(
                        child: Text(
                          'I am a buyer',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Center(
                child: Container(
                  height: 50,
                  width: 400,
                  color: Colors.blue[50],
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/registerS');
                      },
                      child: Center(
                        child: Text(
                          'I am a seller',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
