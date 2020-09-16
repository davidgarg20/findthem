import 'package:flutter/material.dart';

class RegisterP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 80, 40, 80),
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
                        labelText: 'Occupation',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Description of the job',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Area of your service',
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
                        labelText: 'Phone no.',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
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
            ],
          ),
        ),
    );
  }
}
