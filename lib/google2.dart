import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class google2 extends StatefulWidget {
  const google2({super.key});

  @override
  State<google2> createState() => _google2State();
}

class _google2State extends State<google2> {
  StreamSubscription<Position>? positionStream ;
  static const LatLng _pGooglePlex = LatLng(17.242465, -15.663790);
  static const LatLng _pApplePark = LatLng(17.242485, -15.663810);
  LatLng? _currentP;
  @override
  void initState() {
    
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(
        target: _pGooglePlex, zoom: 12,),
        markers: {
          Marker(markerId: MarkerId("_currentLocation"), icon: BitmapDescriptor.defaultMarker, position: _pGooglePlex), 
           Marker(markerId: MarkerId("_sourceLocation"), icon: BitmapDescriptor.defaultMarker, position: _pApplePark), 
        },
        ),
    );
  }
 Future<void> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print("Location services are not enabled");
    return;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied');
  }

  if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
    Position position = await Geolocator.getCurrentPosition();
    print("#########################################");
    print(position.latitude);
    print(position.longitude);
  }
}

}