// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Registration Example'),
// //         ),
// //         body: RegistrationForm(),
// //       ),
// //     );
// //   }
// // }

// // class RegistrationForm extends StatefulWidget {
// //   @override
// //   _RegistrationFormState createState() => _RegistrationFormState();
// // }

// // class _RegistrationFormState extends State<RegistrationForm> {
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController usernameController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController roleController = TextEditingController();

// //   Future<void> registerUser(UserModel user) async {
// //     final url = "https://real-dove-cap.cyclic.app/auth/register";
// //     try {
// //       final response = await http.post(
// //         Uri.parse(url),
// //         headers: {"Content-Type": "application/json"},
// //         body: jsonEncode(user.toJson()),
// //       );

// //       print('Request Body: ${user.toJson()}');

// //       if (response.statusCode == 200) {
// //         // Successful registration
// //         final Map<String, dynamic> data = json.decode(response.body);
// //         String token = data['token'];
// //         // Handle the token as needed (e.g., save to secure storage, navigate to the next screen)
// //         print('Token: $token');
// //       } else {
// //         // Handle errors
// //         print('Failed to register. Status code: ${response.statusCode}');
// //         print('Response: ${response.body}');
// //       }
// //     } catch (error) {
// //       print('Error: $error');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           TextField(
// //             controller: emailController,
// //             decoration: InputDecoration(labelText: 'Email'),
// //           ),
// //           TextField(
// //             controller: usernameController,
// //             decoration: InputDecoration(labelText: 'Username'),
// //           ),
// //           TextField(
// //             controller: passwordController,
// //             obscureText: true,
// //             decoration: InputDecoration(labelText: 'Password'),
// //           ),
// //           SizedBox(height: 16),
// //           ElevatedButton(
// //             onPressed: () async {
// //               await registerUser(UserModel(
// //                   email: "uusserr@gmail.com",
// //                   username: "usser",
// //                   password: "123123",
// //                   role: "user"));
// //             },
// //             child: Text('Register'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class UserModel {
// //   String email;
// //   String username;
// //   String password;
// //   String role;

// //   UserModel({
// //     required this.email,
// //     required this.username,
// //     required this.password,
// //     required this.role,
// //   });

// //   Map<String, String> toJson() {
// //     return {
// //       'email': email,
// //       'username': username,
// //       'password': password,
// //       'role': role,
// //     };
// //   }
// // }
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class UserModel {
//   String email;
//   String password;

//   UserModel({
//     required this.email,
//     required this.password,
//   });

//   Map<String, String> toJson() {
//     return {
//       'email': email,
//       'password': password,
//     };
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Login Example'),
//         ),
//         body: LoginForm(),
//       ),
//     );
//   }
// }

// class LoginForm extends StatefulWidget {
//   @override
//   _LoginFormState createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   Future<void> loginUser(UserModel user) async {
//     final url = 'https://real-dove-cap.cyclic.app/auth/login';

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(user.toJson()),
//       );
//       print('Request Body: ${user.toJson()}');

//       if (response.statusCode == 200) {
//         // Successful login
//         final Map<String, dynamic> data = json.decode(response.body);
//         String token = data['token'];
//         print('Token: $token');
//       } else {
//         // Handle errors
//         print('Failed to login. Status code: ${response.statusCode}');
//         print('Response: ${response.body}');
//       }
//     } catch (error) {
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextField(
//             controller: emailController,
//             decoration: InputDecoration(labelText: 'Email'),
//           ),
//           TextField(
//             controller: passwordController,
//             obscureText: true,
//             decoration: InputDecoration(labelText: 'Password'),
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () async {
//               UserModel user = UserModel(
//                 email: emailController.text,
//                 password: passwordController.text,
//               );

//               loginUser(user);
//             },
//             child: Text('Login'),
//           ),
//         ],
//       ),
//     );
//   }
// }
