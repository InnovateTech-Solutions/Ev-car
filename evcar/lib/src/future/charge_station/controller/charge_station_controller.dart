import 'dart:convert';

import 'package:get/get.dart';

import '../repository/charge_station_model/charge_model.dart';
import 'package:http/http.dart' as http;

class ChargeStationController extends GetxController {
  RxBool seeMore = false.obs;
  var stations = <ChargeModel>[].obs;
  late final ChargeModel station;

  void fetchHomeChargeProvider() async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/stations/getStationsByType/home_charging_provider',
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<ChargeModel> parsedStations =
            data.map((station) => ChargeModel.fromJson(station)).toList();

        stations.assignAll(parsedStations);
      } else {
        // ignore: avoid_print
        print('Failed to fetch stations: ${response.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception while fetching stations: $e');
    }
  }

  void fetchMobileCharging() async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/stations/getStationsByType/mobile_charging',
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<ChargeModel> parsedStations =
            data.map((station) => ChargeModel.fromJson(station)).toList();

        stations.assignAll(parsedStations);
      } else {
        // ignore: avoid_print
        print('Failed to fetch stations: ${response.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception while fetching stations: $e');
    }
  }

  @override
  void onInit() {
    fetchHomeChargeProvider();
    super.onInit();
  }
}
