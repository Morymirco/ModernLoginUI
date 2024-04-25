import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGuinea = CameraPosition(
    target: LatLng(9.9456, -9.6966), // Coordinates for Guinea
    zoom: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 400,
        width: 400,
        child: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: _kGuinea,
          onMapCreated: (GoogleMapController controller) {
            //_controller.complete(controller);

            print("Carte completement charger");
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToGuinea,
      //   label: const Text('To Guinea!'),
      //   icon: const Icon(Icons.directions),
      // ),
    );
  }

  Future<void> _goToGuinea() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kGuinea));
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Guinea Map',
    home: MapSample(),
  ));
}
