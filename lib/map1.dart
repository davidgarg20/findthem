import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_map_location_picker/generated/l10n.dart'
    as location_picker;
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map1View extends StatefulWidget {
  @override
  _Map1ViewState createState() => _Map1ViewState();
}

class _Map1ViewState extends State<Map1View> {
  Position position = null;
  LocationResult _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData.dark(),
      title: 'location picker',
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
          title: const Text('location picker'),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    onPressed: () async {
                      await loadposition();
                    },
                    child: Text("Pick Location"))
              ],
            ),
          );
        }),
      ),
    );
  }

  Future<bool> loadposition() async {
    LocationResult result = await showLocationPicker(
      context, "AIzaSyDSkUAYQGGwFOx5Htr-kFCcEuTn4Kz1Ftg",
      initialCenter: LatLng(31.1975844, 29.9598339),
      initialZoom: 100,
      //                    automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
      myLocationButtonEnabled: true,
      //                   requiredGPS: true,
      layersButtonEnabled: true,
      //                      countries: ['IN'],
//                      resultCardAlignment: Alignment.bottomCenter,
      desiredAccuracy: LocationAccuracy.best,
    );
    print("result = $result");
    setState(() => _pickedLocation = result);

    return true;
  }
}
