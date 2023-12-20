// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: MyHomePage(),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   bool isExpanded = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Search Container'),
// //       ),
// //       body: Stack(
// //         children: [
// //           AnimatedContainer(
// //             duration: Duration(milliseconds: 300),
// //             padding: EdgeInsets.all(16.0),
// //             width: MediaQuery.of(context).size.width,
// //             height:
// //                 isExpanded == true ? MediaQuery.of(context).size.height : 100.0,
// //             color: Colors.blue,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     IconButton(
// //                       icon: Icon(Icons.arrow_back),
// //                       color: Colors.white,
// //                       onPressed: () {
// //                         setState(() {
// //                           isExpanded = false;
// //                         });
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 16.0),
// //                 Text(
// //                   'Your Content Goes Here',
// //                   style: TextStyle(color: Colors.white),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           IconButton(
// //             icon: Icon(Icons.close),
// //             color: Colors.white,
// //             onPressed: () {
// //               setState(() {
// //                 isExpanded = false;
// //                 print(isExpanded);
// //               });
// //             },
// //           ),
// //           Container(
// //             padding: EdgeInsets.all(16.0),
// //             color: Colors.transparent,
// //             child: TextField(
// //               onTap: () {
// //                 setState(() {
// //                   isExpanded = true;
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 hintText: 'Search...',
// //                 hintStyle: TextStyle(color: Colors.white),
// //                 border: InputBorder.none,
// //               ),
// //               style: TextStyle(color: Colors.white),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyController extends GetxController {
//   RxBool isExpanded = false.obs;
// }

// class MyApp extends StatelessWidget {
//   final MyController myController = MyController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Search Container'),
//         ),
//         body: Stack(
//           children: [
//             Obx(
//               () => AnimatedContainer(
//                 duration: Duration(milliseconds: 300),
//                 padding: EdgeInsets.all(16.0),
//                 width: MediaQuery.of(context).size.width,
//                 height: myController.isExpanded.value
//                     ? MediaQuery.of(context).size.height
//                     : 100.0,
//                 color: Colors.blue,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.arrow_back),
//                           color: Colors.white,
//                           onPressed: () {
//                             myController.isExpanded.value = false;
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16.0),
//                     Text(
//                       'Your Content Goes Here',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
