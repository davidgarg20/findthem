import 'package:flutter/material.dart';
import 'package:findthem/database/database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:findthem/http/orderservice.dart';
import 'package:geolocator/geolocator.dart';

class OrderView extends StatefulWidget {
  Order order;
  OrderView({Key key, @required this.order}) : super(key: key);
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    Order order = widget.order;
    Set<Marker> marker = {};
    Marker mymarker = Marker(
        markerId: MarkerId('0'),
        position: LatLng(order.latitude, order.longitude));
    marker.add(mymarker);

    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: [
          Container(
              height: 250,
              child: GoogleMap(
                  scrollGesturesEnabled: true,
                  markers: marker,
                  onCameraMove: (CameraPosition p) {
                    print(p);
                  },
                  onCameraMoveStarted: () {
                    print("start");
                  },
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(order.latitude, order.longitude),
                    zoom: 16.476,
                  ))),
          Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "OrderDetails",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Order Description : ",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              Text(order.detail),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Location : ",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              Text(order.glocation),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "BuyerDetails",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              FutureBuilder(
                  future: loadbuyer(order.userid),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var height = (MediaQuery.of(context).size.height) * 0.2;
                    if (snapshot.hasData) {
                      Buyer buyer = snapshot.data;
                      return Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Buyer Name : ",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            ),
                          ),
                          Text(buyer.name),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Mobile No. : ",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            ),
                          ),
                          Text(buyer.phoneno),
                        ],
                      ));
                    } else
                      return Container(
                          height: height,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          ));
                  })
            ],
          ))
        ]))));
  }
}
