import 'dart:convert';
import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRegisterController extends GetxController {
  final RxString token = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  loadToken() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      token.value = prefs.getString('token') ?? '';
      print('done');
      print(token.value);
    } catch (e) {
      print('Error loading token: $e');
    }
  }

  _saveToken(String token) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      print("save token: " + token);
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  clearToken() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      token.value = '';
    } catch (e) {
      print('Error clearing token: $e');
    }
  }

  void postUser(UserModel userModel) async {
    var apiUrl = Uri.parse(ApiKey.register);

    var jsonString = jsonEncode(userModel.toJson());

    try {
      var response = await http.post(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonString,
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
        print('Response: ${response.body}');
        print(userModel.toJson());
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }

      Map<String, dynamic> responseMap = json.decode(response.body);

      if (responseMap['status'] == 'success') {
        String userToken = responseMap['token'];
        _saveToken(userToken);
        token.value = userToken;
      } else {
        // Handle error case
      }
    } catch (error) {
      print('Error sending data: $error');
    }
  }
}
