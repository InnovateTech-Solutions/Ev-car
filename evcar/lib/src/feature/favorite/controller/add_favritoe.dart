import 'dart:convert';

import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:http/http.dart' as http;

class AddFavorite {
  static AddFavorite get instance => AddFavorite();

  Future<void> addChargingStation(ChargingStationModel chargingStation) async {
    final apiUrl =
        'https://adventurous-yak-pajamas.cyclic.app/stations/getStationsByType/mobile_charging';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(chargingStation.toJson()),
      );

      if (response.statusCode == 200) {
        // Handle success
        print('Charging station added successfully');
      } else {
        // Handle error
        print(
            'Failed to add charging station. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Error adding charging station: $e');
    }
  }
}
