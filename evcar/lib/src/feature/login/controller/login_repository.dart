// import 'dart:convert';

// import 'package:evcar/src/feature/google_map/view/pages/google_map_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class SubLoginRepostiory extends GetxController {
//   final RxString token = ''.obs;
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final fromKey = GlobalKey<FormState>();

//   @override
//   void onInit() {
//     super.onInit();
//     _loadToken();
//   }

//   _loadToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     token.value = prefs.getString('LoginToken') ?? '';
//   }

//   clearToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('LoginToken');
//     token.value = '';
//   }

//   _saveToken(String token) async {
//     print('Saving token: $token');
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('LoginToken', token);
//   }

//   Future<void> postUser(String phone, String password) async {
//     var apiUrl =
//         Uri.parse('https://adventurous-yak-pajamas.cyclic.app/auth/login');

//     var jsonData = {
//       'phone': "962$phone",
//       'password': password,
//     };

//     var jsonString = jsonEncode(jsonData);

//     try {
//       var response = await http.post(
//         apiUrl,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonString,
//       );

//       if (response.statusCode == 200) {
//         print('Data sent successfully');
//         print('Response: ${response.body}');
//       } else {
//         print('Failed to send data. Status code: ${response.statusCode}');
//         print('Response: ${response.body}');
//       }

//       Map<String, dynamic> responseMap = json.decode(response.body);

//       if (responseMap['status'] == 'success') {
//         String userToken = responseMap['token'];
//         print('Received token: $userToken');
//         _saveToken(userToken); // Save the token here
//         token.value = userToken;
//         Get.offAll(const GoogleMapPage());
//       } else {
//         // Handle error case
//         print('Login failed. Status: ${responseMap['status']}');
//       }
//     } catch (error) {
//       print('Error sending data: $error');
//     }
//   }
// }
