import 'package:flutter/material.dart';
import 'package:findthem/http/loginservice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    signin();
  }

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var error = false;
  var errormessage = "Error";
  bool seller = false;
  bool logina = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome to',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 50,
                  fontFamily: 'Lobster',
                ),
              ),
              Text(
                'findThem',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 50,
                  fontFamily: 'Lobster',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Login to your account to continue',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[800],
//                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment(1, 0),
                padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgotpassword');
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.green[600],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              error
                  ? Text(
                      errormessage,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
//                  fontWeight: FontWeight.bold,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(0),
                    ),
              Row(
                children: [
                  Checkbox(
                      value: seller,
                      onChanged: (value) {
                        if (value)
                          setState(() {
                            seller = true;
                          });
                        else
                          setState(() {
                            seller = false;
                          });
                      }),
                  Text("Do you want to login as a Seller"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              seller
                  ? Padding(padding: EdgeInsets.all(0))
                  : Container(
                      height: 60,
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: logina ? Colors.lightGreen : Colors.green,
                        child: GestureDetector(
                          onTap: logina
                              ? () {}
                              : () async {
                                  setState(() {
                                    logina = true;
                                  });
                                  ProgressDialog pr = ProgressDialog(context);
                                  pr = ProgressDialog(
                                    context,
                                    type: ProgressDialogType.Normal,
                                    isDismissible: false,
                                  );
                                  pr.style(
                                      message: 'Logging in..',
                                      borderRadius: 10.0,
                                      backgroundColor: Colors.white,
                                      progressWidget:
                                          CircularProgressIndicator(),
                                      elevation: 10.0,
                                      messageTextStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.w600));
                                  await pr.show();
                                  print("hello");
                                  var k = await login(emailcontroller.text,
                                      passwordcontroller.text);
                                  pr.hide();

                                  if (k == "Login Sucessfull") {
                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                  } else {
                                    errormessage = k.toString();
                                    setState(() {
                                      error = true;
                                    });
                                  }
                                  setState(() {
                                    logina = false;
                                  });
                                },
                          child: Center(
                            child: Text(
                              'LOGIN',
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
              seller
                  ? Container(
                      height: 60,
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: logina ? Colors.lightGreen : Colors.green,
                        child: GestureDetector(
                          onTap: logina
                              ? () {}
                              : () async {
                                  setState(() {
                                    logina = true;
                                  });
                                  ProgressDialog pr = ProgressDialog(context);
                                  pr = ProgressDialog(
                                    context,
                                    type: ProgressDialogType.Normal,
                                    isDismissible: false,
                                  );
                                  pr.style(
                                      message: 'Logging in..',
                                      borderRadius: 10.0,
                                      backgroundColor: Colors.white,
                                      progressWidget:
                                          CircularProgressIndicator(),
                                      elevation: 10.0,
                                      messageTextStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.w600));
                                  await pr.show();
                                  print("hello");
                                  var k = await loginseller(
                                      emailcontroller.text,
                                      passwordcontroller.text);
                                  pr.hide();

                                  if (k == "Login Sucessfull") {
                                    Navigator.pushReplacementNamed(
                                        context, '/sellerhome');
                                  } else {
                                    errormessage = k.toString();
                                    setState(() {
                                      error = true;
                                    });
                                  }
                                  setState(() {
                                    logina = false;
                                  });
                                },
                          child: Center(
                            child: Text(
                              'LOGIN AS A SELLER',
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
                    )
                  : Padding(padding: EdgeInsets.all(0)),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/poc');
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.green[600],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
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
      ),
    );
  }

  Future<bool> signin() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    p.reload();
    bool t = p.getBool("login");
    bool k = p.getBool("loginseller");
    print(t);
    if (t == true) {
      Navigator.pushReplacementNamed(context, '/home');
    }
    if (k == true) {
      Navigator.pushReplacementNamed(context, '/sellerhome');
    }
  }
}
