import 'dart:convert';

import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ChargingStationController extends GetxController {
  void openGoogleMap(coordinates) async {
    final coordinate = coordinates;
    final latLng = coordinate.split(',');
    final latitude = double.tryParse(latLng[0].trim()) ?? 0.0;
    final longitude = double.tryParse(latLng[1].trim()) ?? 0.0;
    Uri mapUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (!await launchUrl(mapUrl)) {
      throw Exception('Could not launch $mapUrl');
    }
  }

  Future<List<ChargingStationModel>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/stations/getStationsByType/home_charging_provider'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<ChargingStationModel> stations =
          data.map((item) => ChargingStationModel.fromJson(item)).toList();
      return stations;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
