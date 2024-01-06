import 'dart:convert';

import 'package:evcar/src/future/charging_station/model/detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StationController extends GetxController {
  RxList<ChargingStationModel> stations = <ChargingStationModel>[].obs;

  Future<void> searchStations(String query) async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/stations/search/$query'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      stations.value = data
          .map((dynamic station) => ChargingStationModel.fromJson(station))
          .toList();
    } else {
      throw Exception('Failed to load stations');
    }
  }
}
