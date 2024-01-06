import 'dart:convert';

import 'package:evcar/src/future/charging_station/model/detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class PortableChargerController extends GetxController {
  final RxBool seeMore = false.obs;

  void openWhatsAppChat(String phoneNumber) async {
    final url = Uri.parse('https://wa.me/$phoneNumber');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchPhoneCall(String phoneNumber) async {
    final url = Uri.parse('tel:$phoneNumber');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<List<ChargingStationModel>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/stations/getStationsByType/mobile_charging'));

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