import 'dart:convert';

import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MaintenanceShopController extends GetxController {
  Future<List<Vendor>> getAllVendor() async {
    final response = await http.get(Uri.parse(ApiKey.getAllVendor));
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey("allVendors")) {
        List<dynamic> data = responseData["allVendors"];
        List<Vendor> vendors = data.map((e) => Vendor.fromMap(e)).toList();
        print(vendors);
        return vendors;
      } else {
        throw Exception('Invalid data format: missing "allVendors" key');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
