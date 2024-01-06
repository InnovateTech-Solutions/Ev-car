import 'package:get/get.dart';

class ApiResponse extends GetxController {
  final String status;
  final String token;

  ApiResponse({required this.status, required this.token});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      token: json['token'],
    );
  }
}
