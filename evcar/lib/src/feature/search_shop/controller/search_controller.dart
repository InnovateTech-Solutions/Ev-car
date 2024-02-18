import 'dart:convert';

import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/product/model/product_detail_model.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchControllerr extends GetxController {
  var selectedTabIndex = 0.obs;
  RxList<Vendor> vendorsearch = <Vendor>[].obs;
  RxList<ProductDetails> product = <ProductDetails>[].obs;

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }

  Future<void> searchForTab1(String query) async {
    // Make API call for Tab 1
    final response = await http.get(
      Uri.parse('${ApiKey.productsearch}$query'),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      product.value = data
          .map((dynamic station) => ProductDetails.fromJson(station))
          .toList();
      print(product.length);
    } else {
      throw Exception('Failed to load stations');
    }
  }

  Future<void> searchForTab2(String query) async {
    // Make API call for Tab 2
    final response = await http.get(
      Uri.parse('${ApiKey.shopSearch}$query'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      vendorsearch.value =
          data.map((dynamic station) => Vendor.fromMap(station)).toList();
      print(vendorsearch.first.id);
    } else {
      throw Exception('Failed to load stations');
    }
    if (response.statusCode == 200) {
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }
}
