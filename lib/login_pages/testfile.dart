import 'package:flutter/material.dart';

class RegisterC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 80, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Please fill the following information to create your account',
                style: TextStyle(
                  fontSize: 20,

                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'State',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone No.',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  height: 50,
                  width: 200,
                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Center(
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 2,
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
