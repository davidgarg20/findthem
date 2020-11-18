import 'package:flutter/material.dart';
import '../navigation_bloc/navigation_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:findthem/database/database.dart';
import 'package:findthem/http/mapservice.dart';
import 'package:findthem/http/orderservice.dart';
import 'orderview.dart';

class SellerHome extends StatefulWidget {
  @override
  _SellerHomeState createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  bool k = true;
  Widget OrderDesign(Order order) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'OrderId:',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  order.id.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Category:',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  order.category,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Detail:',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  order.detail,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Order Location:',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    order.glocation,
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            RaisedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderView(order: order),
                    ),
                  );
                },
                child: Text("View Complete Order")),
            SizedBox(
              height: 5,
            ),
            RaisedButton(
                onPressed: () async {
                  await ordercompleted(order.id.toString());
                  setState(() {
                    k = false;
                  });
                  await Future.delayed(Duration(seconds: 1));

                  setState(() {
                    k = true;
                  });
                },
                child: Text("Mark as Completed")),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  bool orderview = false;
  var orderid = null;
  Position position = null;
  Set<Marker> marker = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                    future: loadposition(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      var height = (MediaQuery.of(context).size.height) * 0.5;
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
                orderview
                    ? FutureBuilder(
                        future: loadorder(orderid),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          var height =
                              (MediaQuery.of(context).size.height) * 0.2;
                          if (snapshot.hasData) {
                            Order order = snapshot.data;
                            return Container(
                                child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "OrderDetails",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Order Description : ",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87),
                                  ),
                                ),
                                Text(order.detail),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Location : ",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87),
                                  ),
                                ),
                                Text(order.glocation),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    onPressed: () async {
                                      await orderaccept(order.id.toString());
                                      setState(() {
                                        k = false;
                                      });
                                      await Future.delayed(
                                          Duration(seconds: 1));

                                      setState(() {
                                        orderview = false;
                                        k = true;
                                      });
                                    },
                                    child: Text("Accept Order"),
                                  ),
                                )
                              ],
                            ));
                          } else
                            return Container(
                                height: height,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ));
                        })
                    : Padding(
                        padding: EdgeInsets.all(0),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Pending Orders",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                k
                    ? FutureBuilder(
                        future: loadsellerorders(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Order>> snapshot) {
                          if (snapshot.hasData) {
                            List<Order> orders = snapshot.data;
                            return Column(
                              children: orders
                                  .map((order) => OrderDesign(order))
                                  .toList(),
                            );
                          } else
                            return CircularProgressIndicator();
                        })
                    : Padding(padding: EdgeInsets.all(0)),
              ],
            ),
          ),
        ));
  }

  Future<bool> loadposition() async {
    position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var k = await loadordermarker(position.latitude, position.longitude);
    print("test1");
    print(k);
    int t = 1;
    for (var mark in k) {
      final icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(400, 400)),
          'assets/images/ordermap.png');
      Marker mymarker = Marker(
          icon: icon,
          onTap: () {
            print("click");
            if (orderview == false) {
              setState(() {
                orderid = mark.id;
                orderview = true;
              });
            } else {
              setState(() {
                orderview = false;
              });
            }
          },
          markerId: MarkerId(t.toString()),
          position: LatLng(mark.latitude, mark.longitude));
      marker.add(mymarker);
      print(mymarker.position);
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
