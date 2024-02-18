import 'dart:convert';

import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/maintenance/model/services_model.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MaintenanceController extends GetxController {
  Future<List<ServicesModel>> fetchTags() async {
    final response = await http.get(Uri.parse(ApiKey.fetchTags));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<ServicesModel> stations =
          data.map((item) => ServicesModel.fromJson(item)).toList();
      return stations;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Vendor>> fetchVendors() async {
    final response =
        await http.get(Uri.parse("${ApiKey.fetchNumberOfVendors}5"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey("vendors")) {
        List<dynamic> vendorData = data["vendors"];
        List<Vendor> vendors =
            vendorData.map((item) => Vendor.fromMap(item)).toList();
        print(vendors);
        return vendors;
      } else {
        throw Exception('Invalid data format: missing "vendors" key');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Product>> FetchProductNumber() async {
    final response = await http.get(Uri.parse("${ApiKey.FetchProductNumber}5"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey("randomProducts")) {
        List<dynamic> productData = data["randomProducts"];
        List<Product> product =
            productData.map((item) => Product.fromJson(item)).toList();
        print(product.length);
        return product;
      } else {
        throw Exception('Invalid data format: missing "vendors" key');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
