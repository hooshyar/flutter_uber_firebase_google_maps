import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class MapWidget extends StatefulWidget {
  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  String? _mapStyle;

  initState() {
    super.initState();
    // load the map style from the asset text
    rootBundle.loadString('assets/maps/style1.txt').then((string) {
      _mapStyle = string;
    });
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.1934578323925, 43.96567824238303),
    zoom: 40.4746,
  );
  //36.1934578323925, 43.96567824238303
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 50.440717697143555,
      zoom: 40);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          controller.setMapStyle(_mapStyle); // change the map style
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
