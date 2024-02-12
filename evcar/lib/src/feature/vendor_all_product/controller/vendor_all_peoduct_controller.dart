import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorAllProductController extends GetxController {
  // Future<List<String>> fetchProductTypes() async {
  //   final String apiUrl =
  //       'https://adventurous-yak-pajamas.cyclic.app/vendors/getAllVendorProductsClassified/65bd7c0dfce0a971d9dfd769';

  //   final response = await http.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = json.decode(response.body);
  //     return data['classifiedProducts'].keys.toList();
  //   } else {
  //     throw Exception('Failed to load products');
  //   }
  // }
  Future<Map<String, dynamic>> fetchData(String id) async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/vendors/getAllVendorProductsClassified/65bd7c0dfce0a971d9dfd769'));
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
