import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  void initState()
  {
    loadposition();
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(position.latitude, position.longitude),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    print(position);
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        
      ),
      
    );
  }

  
  }
