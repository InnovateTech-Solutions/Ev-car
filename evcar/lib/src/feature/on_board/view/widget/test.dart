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

class UserModel {
  final String username;

  UserModel({required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(username: json['username']);
  }
}

Future<UserModel> getUserDetails() async {
  final response = await http.get(
    Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/users/getUserDetails'),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk2Mjc3Nzc3Nzc3NyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzA0NTcyNDU5LCJleHAiOjE3MDUxNzcyNTl9.tVXRmXjK3n0Og-7sFVOZRht0aqeEAQDp0d3Fmd2mcgk',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    final UserModel user = UserModel.fromJson(responseData);
    return user;
  } else {
    throw Exception('Failed to load user details');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: UserDetailsScreen(),
      ),
    );
  }
}

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late Future<UserModel> userDetails;

  @override
  void initState() {
    super.initState();
    userDetails = getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<UserModel>(
        future: userDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text(
              'Username: ${snapshot.data!.username}',
              style: TextStyle(fontSize: 20),
            );
          }
        },
      ),
    );
  }
}
