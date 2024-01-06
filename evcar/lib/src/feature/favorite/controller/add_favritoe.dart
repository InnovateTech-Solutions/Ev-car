import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddFavorite extends GetxController {
  static AddFavorite get instance => AddFavorite();
  RxString favoriteId = "".obs;

  Future<void> addChargingStation(String stationId) async {
    final apiUrl = Uri.parse(
        "https://adventurous-yak-pajamas.cyclic.app/favorites/addFavorite");

    try {
      final response = await http.post(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk2Mjc3Nzc3Nzc3NyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzA0NTczODM0LCJleHAiOjE3MDUxNzg2MzR9.60avxilUR3FwUfMENXbRnlMfu9pHsj7754Pr7qhPDH0',
        },
        body: jsonEncode({
          'stationId': stationId,
        }),
      );

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);

        final favoriteData = jsonResponse['favorite'];
        favoriteId.value = favoriteData['_id'];
        print(jsonResponse);
        print('Favorite added successfully. FavoriteId: $favoriteId');
      } else {
        print(
            'Failed to add charging station. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Error adding charging station: $e');
    }
  }

  Future<void> deleteChargingStation() async {
    final apiUrl =
        'https://adventurous-yak-pajamas.cyclic.app/favorites/deleteFavorite/${favoriteId.value}';

    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk2Mjc3Nzc3Nzc3NyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzA0NTczODM0LCJleHAiOjE3MDUxNzg2MzR9.60avxilUR3FwUfMENXbRnlMfu9pHsj7754Pr7qhPDH0',
        },
      );

      if (response.statusCode == 200) {
        // Handle success
        print('Charging station deleted successfully');
      } else {
        // Handle error
        print(
            'Failed to delete charging station. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle exception
      print('Error deleting charging station: $e');
    }
  }
}
