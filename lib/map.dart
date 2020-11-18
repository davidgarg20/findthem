import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:findthem/database/database.dart';
import 'package:findthem/http/mapservice.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Position position = null;
  bool seller = false;
  String sellername = "seller";
  Set<Marker> marker = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
        padding: const EdgeInsets.only(right: 50),
        child: Text("Location"),
      )),
      body: Column(children: [
        FutureBuilder(
          future: loadposition(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var height = (MediaQuery.of(context).size.height) * 0.5;
            if (snapshot.hasData) {
              return Container(
                height: height,
                child: GoogleMap(
                  scrollGesturesEnabled: true,
                  //  onCameraMove: (CameraPosition p) { print(p); },
                  //  onCameraMoveStarted: () { print("start"); },
                  //  onTap: (LatLng l) { print(l)},

                  mapType: MapType.normal,
                  markers: marker,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 16.476,
                  ),
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(hintText: "HOUSE/FLAT/BLOCK NO."),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(hintText: "LANDMARK"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            color: Colors.orange,
            child: Container(child: Text("CONFIRM")),
          ),
        )
      ]),
    );
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
