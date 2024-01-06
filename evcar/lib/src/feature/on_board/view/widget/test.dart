// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MapScreen(),
//     );
//   }
// }

// class MapScreen extends StatelessWidget {
//   final LatLng initialLocation = LatLng(
//       37.7749, -122.4194); // Replace with your desired initial coordinates

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map Example'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             _openMap(context);
//           },
//           child: Container(
//             width: 200,
//             height: 50,
//             color: Colors.blue,
//             child: Center(
//               child: Text(
//                 'Open Map',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _openMap(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => MapPage(initialLocation: initialLocation),
//       ),
//     );
//   }
// }

// class MapPage extends StatefulWidget {
//   final LatLng initialLocation;

//   MapPage({required this.initialLocation});

//   @override
//   _MapPageState createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   late GoogleMapController mapController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Map'),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: (controller) {
//               mapController = controller;
//             },
//             initialCameraPosition: CameraPosition(
//               target: widget.initialLocation,
//               zoom: 15.0,
//             ),
//           ),
//           Positioned(
//             top: 16,
//             left: 16,
//             child: GestureDetector(
//               onTap: () {
//                 _moveToLocation(widget.initialLocation);
//               },
//               child: Container(
//                 width: 200,
//                 height: 50,
//                 color: Colors.blue,
//                 child: Center(
//                   child: Text(
//                     'Tap me to go to location',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _moveToLocation(LatLng location) {
//     mapController.animateCamera(
//       CameraUpdate.newLatLng(location),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String apiUrlAddFavorite =
      "https://adventurous-yak-pajamas.cyclic.app/favorites/addFavorite";
  final String apiUrlDeleteFavorite =
      "https://adventurous-yak-pajamas.cyclic.app/favorites/deleteFavorite";
  final String stationId = "659893d0ce5eef907d1f4623";
  final String apiKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk2Mjc3Nzc3Nzc3NyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzA0NTc1NzEyLCJleHAiOjE3MDUxODA1MTJ9.gD9iFT5A1I4G97Muu6YrR2Sm2r9BOEOXPSMha96ubEk"; // Replace with your actual API key

  String favoriteId = "";

  Future<void> addFavorite() async {
    final response = await http.post(
      Uri.parse(apiUrlAddFavorite),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk2Mjc3Nzc3Nzc3NyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzA0NTc1NzEyLCJleHAiOjE3MDUxODA1MTJ9.gD9iFT5A1I4G97Muu6YrR2Sm2r9BOEOXPSMha96ubEk',
      },
      body: jsonEncode({
        'stationId': stationId,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      favoriteId = jsonResponse['favoriteId'];
      print('Favorite added successfully. FavoriteId: $favoriteId');
    } else {
      print('Failed to add favorite. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(favoriteId);
    }
  }

  Future<void> deleteFavorite() async {
    if (favoriteId.isEmpty) {
      print('No favorite to delete. Please add a favorite first.');
      return;
    }

    final response = await http.delete(
      Uri.parse('$apiUrlDeleteFavorite/$favoriteId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk2Mjc3Nzc3Nzc3NyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzA0NTc1NzEyLCJleHAiOjE3MDUxODA1MTJ9.gD9iFT5A1I4G97Muu6YrR2Sm2r9BOEOXPSMha96ubEk',
      },
    );

    if (response.statusCode == 200) {
      print('Favorite deleted successfully');
      favoriteId = ""; // Reset favoriteId after deletion
    } else {
      print('Failed to delete favorite. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter HTTP Requests'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: addFavorite,
              child: Text('Add Favorite'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deleteFavorite,
              child: Text('Delete Favorite'),
            ),
          ],
        ),
      ),
    );
  }
}
