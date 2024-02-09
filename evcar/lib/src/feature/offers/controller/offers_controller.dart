import 'dart:io';

import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OffersController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  Rx<PlatformFile?> selectedImage = Rx<PlatformFile?>(null);
  File? sotreImageFile;
  RxString imagePath = ''.obs;
  String imageUrl = '';
  final formKey = GlobalKey<FormState>();

  final picker = ImagePicker();

  validDescription(String? description) {
    if (description!.isEmpty) {
      return "يرجى ادخال الوصف";
    }
    return null;
  }

  validtionFiled(String? filed) {
    if (filed!.isEmpty) {
      return "يرجى ادخال أسم العرض";
    }
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      sotreImageFile = File(result.files.single.path!);
      selectedImage.value = result.files.single;
      imagePath.value = result.files.single.path!;

      print(imagePath.value);
    }
  }

  Future<void> uploadStoreImage() async {
    if (sotreImageFile != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('images/$fileName.png');
      UploadTask uploadTask = storageReference.putFile(sotreImageFile!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      imageUrl = await taskSnapshot.ref.getDownloadURL();
      update(); // Notify listeners that the state has changed
    } else {
      print('No image selected.');
    }
  }

  Future<void> addOffers() async {
    if (formKey.currentState!.validate()) {
      if (imageUrl != "") {
      } else {
        Get.snackbar("ERROR", "Invalid Data",
            titleText: Align(
              alignment: Alignment.bottomCenter,
              child: searchsec('حدث خطأ'),
            ));
      }
    } else {
      Get.snackbar("ERROR", "Invalid Data",
          titleText: Align(
            alignment: Alignment.bottomCenter,
            child: searchsec('حدث خطأ'),
          ));
    }
  }
}
