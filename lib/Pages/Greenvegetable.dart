import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../navigation_bloc/navigation_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:findthem/database/database.dart';
import 'package:findthem/http/mapservice.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_map_location_picker/generated/l10n.dart'
    as location_picker;
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dialog.dart';

class Greenvegetable extends StatefulWidget with NaviagtionStates {
  @override
  _GreenvegetableState createState() => _GreenvegetableState();
}

class _GreenvegetableState extends State<Greenvegetable> {
  Position position = null;

  bool seller = false;

  String sellername = "seller";

  Set<Marker> marker = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        location_picker.S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
      ],
      home: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text("Groceries",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'lemon',
                        fontWeight: FontWeight.w800,
                        fontSize: 25))),
            backgroundColor: Colors.black,
          ),
          body: Container(
            color: Colors.white,
            child: PageView(scrollDirection: Axis.vertical, children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100 / 5, 0, 0, 0),
                      child: Image.asset(
                        "./assets/images/groceries.png",
                      ),
                    ),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(150, -50),
                        blurRadius: 50,
                      ),
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(-150, -50),
                        blurRadius: 50,
                      ),
                    ]),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                      Container(
                        height: 200,
                        width: (MediaQuery.of(context).size.width) / 2 - 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 2,
                                offset: Offset(0, 1),
                                spreadRadius: 0.001,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 4,
                                offset: Offset(0, -2),
                                spreadRadius: 0.001,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            ),
                            Image.asset(
                              "./assets/images/fruit-stand.png",
                              scale: 5,
                            ),
                            Center(
                              child: Text(
                                "Fruits",
                                style: TextStyle(
                                    fontFamily: 'lemon', fontSize: 15),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.blue,
                              child: Text(
                                "Order Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              elevation: 5,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return dialog(0);
                                    });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: (MediaQuery.of(context).size.width) / 2 - 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 2,
                                offset: Offset(0, 1),
                                spreadRadius: 0.001,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 4,
                                offset: Offset(0, -2),
                                spreadRadius: 0.001,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            ),
                            Image.asset(
                              "./assets/images/vegetable.png",
                              scale: 5,
                            ),
                            Center(
                              child: Text(
                                "Vegetables",
                                style: TextStyle(
                                    fontFamily: 'lemon', fontSize: 15),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.blue,
                              child: Text(
                                "Order Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              elevation: 5,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return dialog(0);
                                    });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                      Container(
                        height: 200,
                        width: (MediaQuery.of(context).size.width) / 2 - 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 2,
                                offset: Offset(0, 1),
                                spreadRadius: 0.001,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 4,
                                offset: Offset(0, -2),
                                spreadRadius: 0.001,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            ),
                            Image.asset(
                              "./assets/images/snacks.png",
                              scale: 5,
                            ),
                            Center(
                              child: Text(
                                "Snacks",
                                style: TextStyle(
                                    fontFamily: 'lemon', fontSize: 15),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.blue,
                              child: Text(
                                "Order Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              elevation: 5,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return dialog(0);
                                    });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: (MediaQuery.of(context).size.width) / 2 - 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 2,
                                offset: Offset(0, 1),
                                spreadRadius: 0.001,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 4,
                                offset: Offset(0, -2),
                                spreadRadius: 0.001,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            ),
                            Image.asset(
                              "./assets/images/dairy.png",
                              scale: 5,
                            ),
                            Center(
                              child: Text(
                                "Dairy products",
                                style: TextStyle(
                                    fontFamily: 'lemon', fontSize: 15),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.blue,
                              child: Text(
                                "Order Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              elevation: 5,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return dialog(0);
                                    });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              FutureBuilder(
                  future: loadposition(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var height = (MediaQuery.of(context).size.height) * 0.75;
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Nearby Sellers",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              height: height,
                              child: GoogleMap(
                                scrollGesturesEnabled: true,
                                onCameraMove: (CameraPosition p) {
                                  print(p);
                                },
                                onCameraMoveStarted: () {
                                  print("start");
                                },
                                onTap: (LatLng l) {
                                  print(l);
                                },
                                mapType: MapType.normal,
                                markers: marker,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                      position.latitude, position.longitude),
                                  zoom: 16.476,
                                ),
                              )),
                        ],
                      );
                    } else
                      return Container(
                          height: height,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          ));
                  }),
            ]),
          )),
    );
  }

  Future<bool> loadposition() async {
    position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var k = await loadmarker(0, position.latitude, position.longitude);
    int t = 1;
    for (var mark in k) {
      Marker mymarker = Marker(
          markerId: MarkerId(t.toString()),
          position: LatLng(mark.latitude, mark.longitude));
      marker.add(mymarker);
      t = t + 1;
    }
    Marker mymarker = Marker(
        markerId: MarkerId('0'),
        position: LatLng(position.latitude, position.longitude));
    marker.add(mymarker);
    print(position);

    return true;
  }
}
