import 'dart:convert';

import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StationController extends GetxController {
  final searchText = TextEditingController();

  RxList<ChargingStation> stations = <ChargingStation>[].obs;

  Future<void> searchStations(String query) async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/stations/search/$query'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      stations.value = data
          .map((dynamic station) => ChargingStation.fromJson(station))
          .toList();
    } else {
      throw Exception('Failed to load stations');
    }
  }
}
