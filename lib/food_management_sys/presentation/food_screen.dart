import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(27.6908763, 85.3374584),
    zoom: 17,
  );

  final List<Marker> _markers = const [
    Marker(
      markerId: MarkerId('0'),
      position: LatLng(27.6908953, 85.3392394),
      infoWindow: InfoWindow(
        title: 'Ace Institute',
      ),
    ),
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(27.6908953, 85.337050),
      infoWindow: InfoWindow(
        title: 'Dustbin 1',
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _cameraPosition,
      markers: _markers.toSet(),
      onMapCreated: ((controller) => _controller.complete(controller)),
    );
  }
}
