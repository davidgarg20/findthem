import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../navigation_bloc/navigation_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:findthem/database/database.dart';
import 'package:findthem/http/mapservice.dart';
import 'dialog.dart';

class Raddiwala extends StatelessWidget with NaviagtionStates {
  Position position = null;
  bool seller = false;
  String sellername = "seller";
  Set<Marker> marker = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text("Raddiwala",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'lemon',
                      fontWeight: FontWeight.w800,
                      fontSize: 25))),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      (MediaQuery.of(context).size.width) / 5, 0, 0, 0),
                  child: Image.asset(
                    "./assets/images/scrap.png",
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
              Container(
                height: 250,
                width: (MediaQuery.of(context).size.width) - 50,
                margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        offset: Offset(2, 2),
                        spreadRadius: 0.001,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 4,
                        offset: Offset(-2, -2),
                        spreadRadius: 1,
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    ),
                    Image.asset(
                      "./assets/images/shipping-truck.png",
                      scale: 5,
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Mark your Request",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      elevation: 10,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return dialog(1);
                            });
                      },
                    ),
                  ],
                ),
              ),
              Spacer(),
              FutureBuilder(
                  future: loadposition(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var height = (MediaQuery.of(context).size.height) * 0.25;
                    if (snapshot.hasData) {
                      return Container(
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
                              )));
                    } else
                      return Container(
                          height: height,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          ));
                  }),
              Spacer(),
            ],
          ),
        ));
  }

  Future<bool> loadposition() async {
    position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var k = await loadmarker(1, 100, 100);
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
