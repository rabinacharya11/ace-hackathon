import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({Key? key}) : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(27.6909713, 85.3382765),
    zoom: 17,
  );

  final List<Marker> _markers = const [
    Marker(
      markerId: MarkerId('0'),
      position: LatLng(27.691686, 85.3389376),
      infoWindow: InfoWindow(
        title: 'Ace Institute',
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              overflow: TextOverflow.ellipsis),
          title: const Text("Location"),
        ),
        backgroundColor: Colors.grey[200],
        body: GoogleMap(
          initialCameraPosition: _cameraPosition,
          markers: _markers.toSet(),
        ));
  }
}
