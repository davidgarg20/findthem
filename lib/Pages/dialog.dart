import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:findthem/http/placeorder.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:progress_dialog/progress_dialog.dart';

Widget dialog(int category) {
  LocationResult _pickedLocation;
  bool locationpicked = false;
  TextEditingController controller = TextEditingController();
  bool ordererror = false;
  String oerror;
  String orderdetail;
  bool request = false;
  if (category > 0) request = true;

  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    Future<bool> showpicker() async {
      LocationResult result = await showLocationPicker(
        context,
        "AIzaSyDSkUAYQGGwFOx5Htr-kFCcEuTn4Kz1Ftg",
        initialCenter: LatLng(31.1975844, 29.9598339),
        initialZoom: 100,
        myLocationButtonEnabled: true,
        layersButtonEnabled: true,
        desiredAccuracy: LocationAccuracy.best,
      );
      if (result.address != null) {
        print("result = $result");
        setState(() {
          _pickedLocation = result;
          locationpicked = true;
        });
      }

      return true;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: locationpicked ? 400 : 500,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Spacer(),
                  locationpicked
                      ? Text(
                          request ? "Request Details" : "Order Details",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        )
                      : Text(
                          request
                              ? "Enter request Description"
                              : "Enter Order Description",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                  Spacer(),
                  locationpicked
                      ? Column(
                          children: [
                            Text(
                                request
                                    ? "Request Description"
                                    : "Order Description",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                orderdetail,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            TextField(
                              controller: controller,
                              maxLines: 10,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            ordererror
                                ? Text(
                                    oerror,
                                    style: TextStyle(color: Colors.red),
                                  )
                                : Padding(padding: EdgeInsets.all(0))
                          ],
                        ),
                  Spacer(),
                  locationpicked
                      ? Column(
                          children: [
                            Text("Address",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(_pickedLocation.address),
                            ),
                            RaisedButton(
                                color: Colors.blue,
                                child: Text(request
                                    ? "Confirm Request"
                                    : "Confirm Order"),
                                onPressed: () async {
                                  ProgressDialog pr = ProgressDialog(context);
                                  pr = ProgressDialog(
                                    context,
                                    type: ProgressDialogType.Normal,
                                    isDismissible: false,
                                  );
                                  pr.style(
                                      message: request
                                          ? "Placing Request.."
                                          : 'Placing Order....',
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
                                  bool t = await placeorder(
                                      category,
                                      orderdetail,
                                      "None",
                                      _pickedLocation.address,
                                      _pickedLocation.latLng.latitude,
                                      _pickedLocation.latLng.longitude);
                                  await pr.hide();

                                  if (t) {
                                    print("mysuccess");
                                    Alert(
                                      context: context,
                                      type: AlertType.success,
                                      title: request
                                          ? "Request Update"
                                          : "Order Update",
                                      desc: request
                                          ? "Request Successfully Placed"
                                          : "Order Successfully Placed",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "COOL",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          width: 120,
                                        )
                                      ],
                                    ).show();
                                  } else {
                                    print("fail");
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title: request
                                          ? "Request Update"
                                          : "Order Update",
                                      desc: request
                                          ? "Some Error occurred while placing request"
                                          : "Some Error occurred while placing order",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "COOL",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          width: 120,
                                        )
                                      ],
                                    ).show();
                                  }
                                })
                          ],
                        )
                      : RaisedButton(
                          onPressed: () async {
                            orderdetail = controller.text;
                            print(orderdetail);
                            if (orderdetail.length == 0) {
                              setState(() {
                                ordererror = true;
                                oerror = request
                                    ? "Enter Request Description"
                                    : "Enter Order Description";
                              });
                            } else if (orderdetail.length < 20) {
                              setState(() {
                                ordererror = true;
                                oerror = request
                                    ? "Request Description must be 20 characters long"
                                    : "Order Description must be 20 characters long";
                              });
                            } else
                              showpicker();
                          },
                          child: Text("Continue to choose location"),
                          color: Colors.blue[400],
                        ),
                  Spacer(),
                ],
              ),
            ),
          )),
    );
  });
}
