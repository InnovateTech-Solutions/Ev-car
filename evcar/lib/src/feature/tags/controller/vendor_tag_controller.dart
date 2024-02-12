import 'dart:convert';

import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TagController extends GetxController {
  Future<List<Vendor>> fetchVenodrByTags(String id) async {
    final response = await http.get(Uri.parse(
        "https://adventurous-yak-pajamas.cyclic.app/vendors/getVendorsByTag/$id"));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey("vendors")) {
        // Check for "allProducts" instead of "vendors"
        List<dynamic> productData = data["vendors"];
        List<Vendor> review =
            productData.map((item) => Vendor.fromMap(item)).toList();
        print(review.length);
        return review;
      } else {
        throw Exception('Invalid data format: missing "vendors" key');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
