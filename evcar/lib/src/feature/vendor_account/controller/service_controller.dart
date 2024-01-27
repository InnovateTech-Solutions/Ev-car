import 'dart:convert';

import 'package:evcar/src/feature/vendor_account/model/service_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServiceController extends GetxController {
  RxList<ServiceModel> serviceList = <ServiceModel>[].obs;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('your_api_endpoint_here'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        serviceList.assignAll(data.map((item) => ServiceModel.fromJson(item)));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
