import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'We have sent an OTP to your phone number. Enter it in the box below and submit to reset your password.',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 40,),
              TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  hintText: 'Enter OTP here',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey[300],
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text('**Your OTP will expire 15 minutes after you receive it'),
              ),
              SizedBox(height: 25,),
              Center(
                child: Container(
                  height: 40,
                  width: 150,
                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Center(
                        child: Text(
                          'SUBMIT',
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
              SizedBox(height: 20,),
              Center(
                child: Container(
                  height: 40,
                  width: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Re-send OTP',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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