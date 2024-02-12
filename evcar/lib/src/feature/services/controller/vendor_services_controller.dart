import 'dart:convert';

import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:evcar/src/feature/vendor_account/model/service_model.dart';
import 'package:evcar/src/feature/vendor_account/model/tagData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../vendor_account/model/vednor_model.dart';

class VendorServiceaController extends GetxController {
  RxBool isClicked = false.obs;
  RxList servicesList = [].obs;
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController newService = TextEditingController();
  final description = TextEditingController();
  RxString title = "".obs;

  List<String> serviceName = [];
  List<String> serviceID = [];
  final vendorKey = GlobalKey<FormState>();
  final dialogKey = GlobalKey<FormState>();
  RxBool serviceIsEmpty = false.obs;
  RxList<ServiceModel> serviceList = <ServiceModel>[].obs;
    RxList<TagData> serviceList1 = <TagData>[].obs;


  List<String> services = [
    'فحص البطارية',
    'تركيب إطارات ',
    'فحص كمبيوتر',
    'صيانة دورية',
    'كهرباء'
  ];

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber != null && phoneNumber.length == 10) {
      if (GetUtils.isPhoneNumber(phoneNumber)) {
        return null;
      } else {
        return 'رقم الهاتف غير صالح';
      }
    } else {
      return 'رقم الهاتف يجب أن يكون من 10 أرقام';
    }
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/tags/getalltags'));
      print(response.body);
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

  validDescription(String? description) {
    if (description!.isEmpty) {
      return "يرجى ادخال الوصف";
    }
    return null;
  }

  void isSelectedService(ServiceModel service) {
    bool serviceExists = serviceName.contains(service.name);

    if (serviceExists) {
      serviceID.remove(service.id);
      serviceName.remove(service.name);
    } else {
      serviceName.add(service.name);
      serviceID.add(service.id);
    }

    service.isTaped.value = !service.isTaped.value;
    print("The value: ${service.isTaped.value}, ${service.name}");
    print(serviceName);
    print(serviceID);
    update();
  }

  validtionFiled(String? filed) {
    if (filed!.isEmpty) {
      return 'يرجى ادخال عنوان الخدمة';
    }
  }

  Future<void> putVendorServiceDetails(
      {required List<String> serviceList,
      required String token,
      required String description}) async {
    try {
      final response = await http.put(
        Uri.parse('https://adventurous-yak-pajamas.cyclic.app/vendors/update'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({"tags": serviceList, "description": description}),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        print('Updated user details: $responseData');
        // Assuming you want to update UI with the new data, you can put your UI update logic here
      } else {
        throw Exception(
            'Failed to update user details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      // Show error message to the user using SnackBar
    }
  }

  click(String service) {
    if (servicesList.contains(service)) {
      servicesList.remove(service);
      print(isClicked.value);
    } else {
      servicesList.add(service);
      print(servicesList);
    }
  }

  Future<void> fetchVendorTags() async {
  try {
    final response = await http.get(Uri.parse('http://localhost:3000/vendors/allVendorTags/65bac6f821e1dbf0671b8298'));
    print(response.body);
    if (response.statusCode == 200) {

      final List<dynamic> data = json.decode(response.body)['tags'];
      serviceList1.assignAll(data.map((item) => TagData.fromJson(item)));
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}

  Future<void> addNewService() async {
    if (dialogKey.currentState!.validate()) {
      title.value = newService.text;
      servicesList.add(newService.text);
      var url = Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/suggestions/create');

      var requestBody = jsonEncode(
          {"description": description.text, "vendorNumber": phoneNumber.text});

      try {
        var response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: requestBody,
        );

        if (response.statusCode == 20) {
          print('Request successful');
          print('Response: ${response.body}');
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        // An error occurred during the request
        print('Error: $e');
      }
      Get.back();
    } else {
      Get.snackbar("ERROR", "Invalid Data",
          titleText: Align(
            alignment: Alignment.bottomCenter,
            child: searchsec('حدث خطأ'),
          ));
    }
  }

  Future<void> addService(String token, String description) async {
    if (vendorKey.currentState!.validate()) {
      if (description.isNotEmpty) {
        try {
          // Attempt to add service
          await putVendorServiceDetails(
              token: token, description: description, serviceList: serviceID);
          // Show success message
          Get.snackbar("Success", "Service Added Successfully",
              titleText: Align(
                alignment: Alignment.bottomCenter,
                child: searchsec('تمت الإضافة بنجاح'),
              ));
        } catch (error) {
          // Handle error from putVendorServiceDetails
          Get.snackbar("Error", "Failed to add service: $error",
              titleText: Align(
                alignment: Alignment.bottomCenter,
                child: searchsec('حدث خطأ'),
              ));
        }
      } else {
        // Show error for empty description
        Get.snackbar("Error", "Description cannot be empty",
            titleText: Align(
              alignment: Alignment.topRight,
              child: searchsec('حدث خطأ'),
            ));
      }
    } else {
      // Show error for invalid data
      Get.snackbar("Error", "Invalid Data",
          titleText: Align(
            alignment: Alignment.topRight,
            child: searchsec('حدث خطأ'),
          ));
    }
  }

  Future<Vendor> getUserDetails(String token) async {
    print(token);
    final response = await http.get(
      Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/vendors/getVendorDetails'),
      headers: {
        'Authorization': 'Bearer  $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final Vendor vendor = Vendor.fromMap(responseData);
      serviceID = vendor.tags;

      description.text = vendor.description;

      return vendor;
    } else {
      throw Exception('Failed to load user details');
    }
  }
}
