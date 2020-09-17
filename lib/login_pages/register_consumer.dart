import 'package:flutter/material.dart';
import 'package:findthem/http/registerbuyerservice.dart';

class RegisterC extends StatefulWidget {
  @override
  _RegisterCState createState() => _RegisterCState();
}

class _RegisterCState extends State<RegisterC> {
  var namecontroller=TextEditingController();
  var addresscontroller=TextEditingController();
  var citycontroller=TextEditingController();
  var statecontroller=TextEditingController();
  var phonenocontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var confirmpasswordcontroller=TextEditingController();
  var error=false;
  var errormessage="Error";
  bool register=false;
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
                    controller: namecontroller,
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
                    controller: addresscontroller,
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
                    controller: citycontroller,
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
                    controller: statecontroller,
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
                    controller: phonenocontroller,
                    decoration: InputDecoration(
                      labelText: 'Phone No.',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: emailcontroller,
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
                    controller: passwordcontroller,
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
                    controller: confirmpasswordcontroller,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  error? Text(
                errormessage,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
//                  fontWeight: FontWeight.bold,
                ),
              ) : Padding(padding: EdgeInsets.all(0),),
              SizedBox(height: 20,),
                  Center(
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: register? Colors.lightGreen : Colors.green,
                        child: GestureDetector(
                          onTap: register ?(){} : () async{
                           setState(() {
                             register=true;
                           });
                           var k= await registerBuyer(namecontroller.text, addresscontroller.text, citycontroller.text, statecontroller.text, phonenocontroller.text, emailcontroller.text, passwordcontroller.text, confirmpasswordcontroller.text );
                          if(k=="Register Sucessfull")
                           { Navigator.pop(context); Navigator.pop(context); Navigator.pushReplacementNamed(context, '/home');}
                             else
                             { errormessage=k.toString();  setState(() {
                               error=true;
                              });   }
                              setState(() {
                                register=false;
                              });

                         } ,
                          child: Center(
                            child: Text(
                              'REGISTER',
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
