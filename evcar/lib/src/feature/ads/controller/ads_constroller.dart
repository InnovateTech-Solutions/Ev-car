import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdsController extends GetxController {
  //form
  final adsName = TextEditingController();
  final price = TextEditingController();
  final phone = TextEditingController();
  final description = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  Rx<File?> image = Rx<File?>(null);

  final RegExp _priceRegex = RegExp(r'^\d+(\.\d{1,2})?$');
  //type
  var TypeValue = "x".obs;
  List<String> TypeList = ['x', 'Option 2', 'Option 3', 'Option 4'];
  //type
  var categoryValue = "عروض".obs;
  List<String> categoryList = [
    'عروض',
    'اعلان',
  ];
  //drive
  var driveValue = "No".obs;
  List<String> driveList = ['No', 'Yes'];

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
    // print(adsImage);
    // print(adsImage.length);
  }

  Future<void> addFile() async {
    for (int i = 0; i < adsImage.length; i++) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images')
          .child('filename${i + 1}.jpg');
      await storageReference.putFile(File(adsImage[i].path));
      String imageUrl = await storageReference.getDownloadURL();
      imageUrlList.add(imageUrl);
      print(imageUrlList[i]);
    }

    // String imageUrl = await storageReference.getDownloadURL();

    //   // print(file);
    // }
  }

  // Future<void> pickImage(int index) async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     final bytes = await pickedFile.readAsBytes();
  //     adsImage.length > index
  //         ? adsImage[index] = base64Encode(bytes)
  //         : adsImage.add(base64Encode(bytes));
  //   }
  //   print(adsImage.length);
  // }
}
