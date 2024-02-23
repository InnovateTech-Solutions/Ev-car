import 'dart:convert';
import 'dart:io';

import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AdsController extends GetxController {
  //form
  final adsName = TextEditingController();
  final price = TextEditingController();
  final phone = TextEditingController();
  final TypeValue = TextEditingController();
  final description = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  Rx<File?> image = Rx<File?>(null);

  final RegExp _priceRegex = RegExp(r'^\d+(\.\d{1,2})?$');
  //type
  //type
  var categoryValue = "عروض".obs;
  List<String> categoryList = [
    'عروض',
    'اعلان',
  ];
  //drive
  var driveValue = "لا".obs;
  List<String> driveList = ['لا', 'نعم'];

  //validation
  bool isValidPrice(String value) {
    return _priceRegex.hasMatch(value);
  }

  priceValid(value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال السعر';
    }
    if (!isValidPrice(value)) {
      return 'يرجى إدخال سعر مقبول';
    }
    return null;
  }

  vaildPhoneNumber(String? phoneNumber) {
    if (GetUtils.isPhoneNumber(phoneNumber!)) {
      return null;
    }
    return 'رقم الهاتف غير صالح';
  }

  validAdsName(String? name) {
    if (name!.isEmpty) {
      return "اسم المستخدم غير صالح";
    }
    return null;
  }

  validDescription(String? description) {
    if (description!.isEmpty) {
      return "يرجى ادخال الوصف";
    }
    return null;
  }

  //Image
  RxList<File> adsImage = <File>[].obs;
  RxList<String> imageUrlList = <String>[].obs;
  final picker = ImagePicker();

  Future<void> pickImages(int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      adsImage.length > index
          ? adsImage[index] = File(pickedFile.path)
          : adsImage.add(File(pickedFile.path));
    }
    print(adsImage);
    print(adsImage.length);
  }

  Future<void> addFile() async {
    for (int i = 0; i < adsImage.length; i++) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images')
          .child('filename${adsName.text}.jpg');
      final xx = await storageReference.putFile(File(adsImage[i].path));
      String imageUrl = await storageReference.getDownloadURL();
      imageUrlList.add(imageUrl);
      print(xx);
    }
  }

  Future<void> addAds(String token) async {
    if (fromKey.currentState!.validate()) {
      if (adsImage.isNotEmpty) {
        await addFile();
        if (imageUrlList.isNotEmpty) {
          final response = await http.post(Uri.parse(ApiKey.addAds),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: json.encode(
                {
                  "title": adsName.text,
                  "img": imageUrlList,
                  "description": description.text,
                  "typeOfProduct": TypeValue.text,
                  "price": price.text
                },
              ));

          if (response.statusCode == 201) {
            print(json.decode(response.body));
            Get.snackbar("تمت العملية", "تم اضافة القطعة ",
                titleText: Align(
                  alignment: Alignment.topRight, // Set your desired alignment
                  child: searchsec(''),
                ),
                snackStyle: SnackStyle.FLOATING,
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.white,
                backgroundColor: Colors.green);
          } else {
            throw Exception('Failed to load data');
          }
        } else {
          Get.snackbar("خطأ", " المعلومات غير صحيحة",
              titleText: Align(
                alignment: Alignment.topRight, // Set your desired alignment
                child: searchsec('حدث خطأ'),
              ),
              snackStyle: SnackStyle.FLOATING,
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.red);
        }
      }
    } else {
      Get.snackbar("خطأ", " المعلومات غير صحيحة",
          titleText: Align(
            alignment: Alignment.topRight, // Set your desired alignment
            child: searchsec('حدث خطأ'),
          ),
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    }
  }

  var typeList = [].obs; // Observable list to hold product types

  @override
  void onInit() {
    super.onInit();
    fetchProductTypes();
  }

  // Function to fetch product types from the API
  Future<void> fetchProductTypes() async {
    try {
      final response = await http.get(Uri.parse(ApiKey.fetchProductType));
      if (response.statusCode == 200) {
        final List<dynamic> types = json.decode(response.body);
        updateTypeList(types);
      } else {
        throw Exception('Failed to fetch product types');
      }
    } catch (e) {
      print('Error fetching product types: $e');
    }
  }

  // Method to update the list of product types
  void updateTypeList(List<dynamic> newTypes) {
    typeList.clear(); // Clear the existing list
    typeList.addAll(newTypes); // Add new types to the list
  }
}
