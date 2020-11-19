import 'package:flutter/material.dart';
import '../navigation_bloc/navigation_bloc.dart';
import 'package:findthem/database/database.dart';
import 'package:findthem/http/orderservice.dart';

class PreviousOrders extends StatefulWidget with NaviagtionStates {
  @override
  _PreviousOrdersState createState() => _PreviousOrdersState();
}

class _PreviousOrdersState extends State<PreviousOrders> {
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
            Row(
              children: <Widget>[
                Text(
                  'Order Status:',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                order.orderaccepted
                    ? order.ordercompleted
                        ? Text("Completed",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                            ))
                        : Text("Accepted",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                            ))
                    : Text(
                        "Pending",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                        ),
                      ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            order.orderaccepted
                ? RaisedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 100),
                              child: Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: FutureBuilder(
                                          future: loadseller(order.seller),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<Seller> snapshot) {
                                            if (snapshot.hasData) {
                                              Seller seller = snapshot.data;
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: <Widget>[
                                                        Text(
                                                          'SellerId:',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          seller.id.toString(),
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
                                                          'Seller Name:',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          seller.name
                                                              .toString(),
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
                                                          'Address :',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          seller.address
                                                              .toString(),
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
                                                          'City :',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          seller.city
                                                              .toString(),
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
                                                          'Mobine No. :',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          seller.phoneno
                                                              .toString(),
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
                                                    RaisedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("Cool"))
                                                  ],
                                                ),
                                              );
                                            } else
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                          }))));
                        },
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "View Seller Details",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  )
                : Padding(padding: EdgeInsets.all(0)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Previous Orders",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'lemon',
                    fontWeight: FontWeight.w800,
                    fontSize: 25))),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
          future: loadorders(),
          builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
            if (snapshot.hasData) {
              List<Order> orders = snapshot.data;
              return Column(
                children: orders.map((order) => OrderDesign(order)).toList(),
              );
            } else
              return CircularProgressIndicator();
          }),
    );
  }
}
