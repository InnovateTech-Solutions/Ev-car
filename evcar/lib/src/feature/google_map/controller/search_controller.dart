import 'dart:convert';

import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/home_charging_station/model/charging_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StationController extends GetxController {
  final searchText = TextEditingController();

  RxList<ChargingStation> stations = <ChargingStation>[].obs;

  Future<void> searchStations(String query) async {
    final response =
        await http.get(Uri.parse('${ApiKey.searchStations}$query'));

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
