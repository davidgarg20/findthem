import 'package:flutter/material.dart';
import 'package:findthem/http/registerseller.dart';

class RegisterP extends StatefulWidget {
  @override
  _RegisterPState createState() => _RegisterPState();
}

var _currencies = ["Vegetables", "RaddiWala", "Tailor", "Building Contractor"];

class _RegisterPState extends State<RegisterP> {
  var namecontroller = TextEditingController();
  var jobdescriptioncontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var citycontroller = TextEditingController();
  var statecontroller = TextEditingController();
  var pincodecontroller = TextEditingController();
  var phonenocontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();
  var error = false;
  var errormessage = "Error";
  bool register = false;
  var _currentSelectedValue;
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
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Seller Category',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        isEmpty: _currentSelectedValue == null,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _currentSelectedValue,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _currentSelectedValue = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _currencies.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: jobdescriptioncontroller,
                    decoration: InputDecoration(
                      labelText: 'Description of the job',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: addresscontroller,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: citycontroller,
                    decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: statecontroller,
                    decoration: InputDecoration(
                      labelText: 'State',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: pincodecontroller,
                    decoration: InputDecoration(
                      labelText: 'PinCode',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: phonenocontroller,
                    decoration: InputDecoration(
                      labelText: 'Mobile no.',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: confirmpasswordcontroller,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: register ? Colors.lightGreen : Colors.green,
                        child: GestureDetector(
                          onTap: register
                              ? () {}
                              : () async {
                                  setState(() {
                                    register = true;
                                  });
                                  var k = await registerSeller(
                                      namecontroller.text,
                                      _currentSelectedValue,
                                      jobdescriptioncontroller.text,
                                      addresscontroller.text,
                                      citycontroller.text,
                                      statecontroller.text,
                                      pincodecontroller.text,
                                      phonenocontroller.text,
                                      emailcontroller.text,
                                      passwordcontroller.text,
                                      confirmpasswordcontroller.text);
                                  if (k == "Registration Sucessfull") {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                        context, '/sellerhome');
                                  } else {
                                    errormessage = k.toString();
                                    setState(() {
                                      error = true;
                                    });
                                  }
                                  setState(() {
                                    register = false;
                                  });
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
