import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatelessWidget {
  final LatLng initialLocation = LatLng(
      37.7749, -122.4194); // Replace with your desired initial coordinates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _openMap(context);
          },
          child: Container(
            width: 200,
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Open Map',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openMap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPage(initialLocation: initialLocation),
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  final LatLng initialLocation;

  MapPage({required this.initialLocation});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: widget.initialLocation,
              zoom: 15.0,
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                _moveToLocation(widget.initialLocation);
              },
              child: Container(
                width: 200,
                height: 50,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Tap me to go to location',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _moveToLocation(LatLng location) {
    mapController.animateCamera(
      CameraUpdate.newLatLng(location),
    );
  }
}
