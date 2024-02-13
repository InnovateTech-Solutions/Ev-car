// // // // import 'package:flutter/material.dart';
// // // // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // // // void main() {
// // // //   runApp(MyApp());
// // // // }

// // // // class MyApp extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       home: MapScreen(),
// // // //     );
// // // //   }
// // // // }

// // // // class MapScreen extends StatelessWidget {
// // // //   final LatLng initialLocation = LatLng(
// // // //       37.7749, -122.4194); // Replace with your desired initial coordinates

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Map Example'),
// // // //       ),
// // // //       body: Center(
// // // //         child: GestureDetector(
// // // //           onTap: () {
// // // //             _openMap(context);
// // // //           },
// // // //           child: Container(
// // // //             width: 200,
// // // //             height: 50,
// // // //             color: Colors.blue,
// // // //             child: Center(
// // // //               child: Text(
// // // //                 'Open Map',
// // // //                 style: TextStyle(color: Colors.white),
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   void _openMap(BuildContext context) {
// // // //     Navigator.push(
// // // //       context,
// // // //       MaterialPageRoute(
// // // //         builder: (context) => MapPage(initialLocation: initialLocation),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class MapPage extends StatefulWidget {
// // // //   final LatLng initialLocation;

// // // //   MapPage({required this.initialLocation});

// // // //   @override
// // // //   _MapPageState createState() => _MapPageState();
// // // // }

// // // // class _MapPageState extends State<MapPage> {
// // // //   late GoogleMapController mapController;

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Google Map'),
// // // //       ),
// // // //       body: Stack(
// // // //         children: [
// // // //           GoogleMap(
// // // //             onMapCreated: (controller) {
// // // //               mapController = controller;
// // // //             },
// // // //             initialCameraPosition: CameraPosition(
// // // //               target: widget.initialLocation,
// // // //               zoom: 15.0,
// // // //             ),
// // // //           ),
// // // //           Positioned(
// // // //             top: 16,
// // // //             left: 16,
// // // //             child: GestureDetector(
// // // //               onTap: () {
// // // //                 _moveToLocation(widget.initialLocation);
// // // //               },
// // // //               child: Container(
// // // //                 width: 200,
// // // //                 height: 50,
// // // //                 color: Colors.blue,
// // // //                 child: Center(
// // // //                   child: Text(
// // // //                     'Tap me to go to location',
// // // //                     style: TextStyle(color: Colors.white),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   void _moveToLocation(LatLng location) {
// // // //     mapController.animateCamera(
// // // //       CameraUpdate.newLatLng(location),
// // // //     );
// // // //   }
// // // // }import 'dart:convert';
// // // import 'dart:convert';
// // // import 'dart:typed_data';

// // // import 'package:evcar/src/config/sizes/sizes.dart';
// // // import 'package:evcar/src/config/theme/theme.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_svg/svg.dart';
// // // import 'package:get/get.dart';
// // // import 'package:image_picker/image_picker.dart';

// // // class AdsController extends GetxController {
// // //   RxList<String> adsImage = <String>[].obs;
// // //   final picker = ImagePicker();

// // //   Future<void> pickImage(int index) async {
// // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

// // //     if (pickedFile != null) {
// // //       final bytes = await pickedFile.readAsBytes();
// // //       adsImage.length > index
// // //           ? adsImage[index] = base64Encode(bytes)
// // //           : adsImage.add(base64Encode(bytes));
// // //     }
// // //   }
// // // }

// // // class ImagePickerExample extends StatelessWidget {
// // //   final AdsController adsController = Get.put(AdsController());

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Image Picker Example'),
// // //       ),
// // //       body: Container(
// // //         width: context.screenWidth,
// // //         height: context.screenHeight * 0.2,
// // //         child: ListView(
// // //           scrollDirection: Axis.horizontal,
// // //           children: [
// // //             GestureDetector(
// // //               onTap: () => adsController.pickImage(0),
// // //               child: Container(
// // //                 margin: EdgeInsets.only(right: 5),
// // //                 width: 100,
// // //                 height: 100,
// // //                 color: AppTheme.lightAppColors.background,
// // //                 child: Obx(() {
// // //                   if (adsController.adsImage.length > 0 &&
// // //                       adsController.adsImage[0] != null) {
// // //                     Uint8List bytes = base64.decode(adsController.adsImage[0]);
// // //                     return Image.memory(bytes, fit: BoxFit.cover);
// // //                   } else {
// // //                     return SvgPicture.asset("assets/images/image_icon.svg");
// // //                   }
// // //                 }),
// // //               ),
// // //             ),
// // //             SizedBox(
// // //               width: context.screenWidth * 0.65,
// // //               height: context.screenHeight * 0.1,
// // //               child: GridView.builder(
// // //                   scrollDirection: Axis.vertical,
// // //                   itemCount: 6,
// // //                   itemBuilder: (context, index) {
// // //                     int imageIndex = index + 1;
// // //                     return GestureDetector(
// // //                       onTap: () => adsController.pickImage(imageIndex),
// // //                       child: Container(
// // //                         margin: EdgeInsets.all(5),
// // //                         width: 50,
// // //                         height: 50,
// // //                         decoration: BoxDecoration(
// // //                             color: AppTheme.lightAppColors.background,
// // //                             border: Border.all(
// // //                               color: AppTheme.lightAppColors.bordercolor,
// // //                               width: context.screenWidth * 0.005,
// // //                             ),
// // //                             borderRadius: BorderRadius.circular(20)),
// // //                         child: Obx(() {
// // //                           int index = imageIndex;
// // //                           if (adsController.adsImage.length > index) {
// // //                             Uint8List bytes =
// // //                                 base64.decode(adsController.adsImage[index]);
// // //                             return Image.memory(bytes, fit: BoxFit.cover);
// // //                           } else {
// // //                             return SizedBox(
// // //                                 width: 55,
// // //                                 height: 14,
// // //                                 child: Center(
// // //                                   child: SvgPicture.asset(
// // //                                       "assets/images/image_icon.svg"),
// // //                                 ));
// // //                           }
// // //                         }),
// // //                       ),
// // //                     );
// // //                   },
// // //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // //                       crossAxisCount: 3)),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // void main() {
// // //   runApp(GetMaterialApp(
// // //     home: ImagePickerExample(),
// // //   ));
// // // // }
// // // import 'package:evcar/src/config/sizes/sizes.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GetMaterialApp(
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('GetX Dropdown Example'),
// // //         ),
// // //         body: Center(
// // //           child: MyDropDown(),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class MyDropDownController extends GetxController {
// // //   var selectedItem = "Option 1".obs;
// // //   List<String> ll = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
// // // }

// // // class MyDropDown extends StatelessWidget {
// // //   final MyDropDownController controller = Get.put(MyDropDownController());

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Obx(() => Container(
// // //           width: context.screenWidth,
// // //           padding: EdgeInsets.symmetric(horizontal: 20.0),
// // //           decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(10),
// // //             border: Border.all(color: Colors.black),
// // //           ),
// // //           child: DropdownButton<String>(
// // //             value: controller.selectedItem.value,
// // //             icon: Icon(Icons.arrow_drop_down),
// // //             iconSize: 24,
// // //             elevation: 16,
// // //             underline: SizedBox(),
// // //             onChanged: (String? newValue) {
// // //               controller.selectedItem.value = newValue!;
// // //             },
// // //             items: controller.ll.map<DropdownMenuItem<String>>((String value) {
// // //               return DropdownMenuItem<String>(
// // //                 value: value,
// // //                 child: Text(value),
// // //               );
// // //             }).toList(),
// // //           ),
// // //         ));
// // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // // import 'package:get/get.dart';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GetMaterialApp(
// // //       title: 'Rating Dialog Example',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: RatingDialogExample(),
// // //     );
// // //   }
// // // }

// // // class RatingDialogExample extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Rating Dialog Example'),
// // //       ),
// // //       body: Center(
// // //         child: ElevatedButton(
// // //           onPressed: () {
// // //             Get.dialog(RatingDialog());
// // //           },
// // //           child: Text('Open Rating Dialog'),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class RatingDialog extends StatelessWidget {
// // //   final _rating = 0.0.obs;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return AlertDialog(
// // //       title: Text('Rate This App'),
// // //       content: Column(
// // //         mainAxisSize: MainAxisSize.min,
// // //         children: [
// // //           Text('Please rate our app:'),
// // //           SizedBox(height: 20),
// // //           Obx(
// // //             () => RatingBar.builder(
// // //               initialRating: _rating.value,
// // //               minRating: 1,
// // //               direction: Axis.horizontal,
// // //               allowHalfRating: true,
// // //               itemCount: 5,
// // //               itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
// // //               itemBuilder: (context, _) => Icon(
// // //                 Icons.star,
// // //                 color: Colors.amber,
// // //               ),
// // //               onRatingUpdate: (rating) {
// // //                 _rating.value = rating;
// // //               },
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //       actions: [
// // //         TextButton(
// // //           onPressed: () {
// // //             Get.back();
// // //           },
// // //           child: Text('Cancel'),
// // //         ),
// // //         TextButton(
// // //           onPressed: () {
// // //             // Do something with the rating, like submitting it to a server
// // //             print('Rating submitted: $_rating');
// // //             Get.back();
// // //           },
// // //           child: Text('Submit'),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }import 'package:flutter/material.dart';
// // import 'package:evcar/src/feature/product/model/parts_model.dart';
// // import 'package:evcar/src/feature/shop/controller/shop_controller.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // class ProductDetailsScreen extends StatelessWidget {
// //   final ShopController shopController = Get.find<ShopController>();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Product Details'),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Obx(
// //               () {
// //                 if (shopController.isLoading.value) {
// //                   return Center(
// //                     child: CircularProgressIndicator(),
// //                   );
// //                 } else {
// //                   return Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: shopController.products.entries
// //                         .map((entry) => Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Padding(
// //                                   padding: const EdgeInsets.all(8.0),
// //                                   child: Text(
// //                                     entry
// //                                         .key, // Displaying typeOfProduct as header
// //                                     style: TextStyle(
// //                                       fontSize: 20,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 ListView.builder(
// //                                   shrinkWrap: true,
// //                                   physics: NeverScrollableScrollPhysics(),
// //                                   itemCount: entry.value.length,
// //                                   itemBuilder: (context, index) {
// //                                     Product product = entry.value[index];
// //                                     return ListTile(
// //                                       title: Text(product.title),
// //                                       subtitle: Text(product.description),
// //                                       trailing: Text(product.price),
// //                                       onTap: () {
// //                                         // You can navigate to another screen to show detailed product view
// //                                       },
// //                                     );
// //                                   },
// //                                 ),
// //                               ],
// //                             ))
// //                         .toList(),
// //                   );
// //                 }
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Future<Map<String, dynamic>> fetchData() async {
//     final response = await http.get(Uri.parse(
//         'https://adventurous-yak-pajamas.cyclic.app/vendors/getAllVendorProductsClassified/65bd7c0dfce0a971d9dfd769'));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API Demo'),
//       ),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: fetchData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final data = snapshot.data!;
//             return ListView.builder(
//               itemCount: data['classifiedProducts'].length,
//               itemBuilder: (BuildContext context, int index) {
//                 final category =
//                     data['classifiedProducts'].keys.toList()[index];
//                 final products = data['classifiedProducts'][category];
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         category,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: products.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         final product = products[index];
//                         return ListTile(
//                           title: Text(product['title']),
//                           subtitle: Text(product['description']),
//                           trailing: Text('Price: ${product['price']}'),
//                         );
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/shop/widget/widget_collection.dart/accessories_container.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_all_product/controller/vendor_all_peoduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({super.key, required this.id, required this.phone});
  final String id;
  final String phone;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorAllProductController());
    return Container(
      margin: EdgeInsets.all(10),
      child: FutureBuilder<Map<String, dynamic>>(
        future: controller.fetchData(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: TextWidget.subVendorText('There Is No Product'));
          } else {
            final data = snapshot.data!;
            return SizedBox(
              width: context.screenWidth * 0.9,
              height: context.screenHeight * 0.9,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data['classifiedProducts'].length,
                itemBuilder: (BuildContext context, int index) {
                  final category =
                      data['classifiedProducts'].keys.toList()[index];
                  final products = data['classifiedProducts'][category];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextWidget.subVendorText(
                          category,
                        ),
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.9,
                        height: context.screenHeight * 0.35,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = products[index];
                            return Center(
                              child: accessoriesContainer(
                                product: Product(
                                  id: product['_id'],
                                  title: product['title'],
                                  img: product['img'],
                                  price: product['price'],
                                  description: product['description'],
                                  typeOfProduct: " product['typeOfProduct']",
                                  vendor: "",
                                ),
                                phone: phone,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: context.screenHeight * 0.05,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
