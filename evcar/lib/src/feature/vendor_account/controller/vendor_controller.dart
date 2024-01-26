import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:evcar/src/feature/vendor_account/model/service_model.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class VendorController extends GetxController {
  static VendorController get instance => Get.find();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController subTitle = TextEditingController();
  final TextEditingController pictureBase64 = TextEditingController();
  final TextEditingController pBase64 = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController pictureofLicence = TextEditingController();
  final TextEditingController description = TextEditingController();
  final vendorKey = GlobalKey<FormState>();
  Rx<PlatformFile?> selectedImage = Rx<PlatformFile?>(null);
  Rx<PlatformFile?> selectedLicense = Rx<PlatformFile?>(null);
  RxBool hide = true.obs;
  RxString imagePath = ''.obs;
  RxString imageLicense = ''.obs;
  RxBool isTap = false.obs;
  List<String> serviceName = [];
  RxBool isEmpty = false.obs;

  List<ServiceModel> serviceList = <ServiceModel>[
    ServiceModel(name: 'صيانة دورية', isTaped: false.obs),
    ServiceModel(name: ' فحص البطارية', isTaped: false.obs),
    ServiceModel(name: 'فحص كمبيوتر', isTaped: false.obs),
    ServiceModel(name: 'تركيب إطارات ', isTaped: false.obs),
  ].obs;
  File? sotreImageFile;
  String imageUrl = '';
  Rx<File?> storeImage = Rx<File?>(null);
  RxString storeImageUrl = RxString('');

  File? storeLicence;
  String licenceUrl = '';

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

  vaildPassword(String? password) {
    if (!GetUtils.isLengthGreaterOrEqual(password, 6)) {
      return ' الرقم السري غير صالحة';
    }
    return null;
  }

  String removeLeadingZero(String input) {
    return input.replaceAll(RegExp('^0+'), '');
  }

  validtionFiled(String? filed) {
    if (filed!.isEmpty) {
      return 'اسم المركز غير صالح';
    }
  }

  validtionImageFiled(String? filed) {
    if (filed!.isEmpty) {
      return 'ادخل صورة للمركز';
    }
  }

  hidePassword() {
    if (hide.value == false) {
      hide.value = true;
    } else if (hide.value == true) {
      hide.value = false;
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
      pictureBase64.text = result.files.single.path!;
      print(imagePath.value);
    }
  }

  Future<void> pickLicense() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      storeLicence = File(result.files.single.path!);
      selectedImage.value = result.files.single;
      imageLicense.value = result.files.single.path!;
      pBase64.text = result.files.single.path!;
      print(imageLicense.value);
    }
  }

  Future<String> imageToBase64(String imagePath) async {
    try {
      // Read the image file as bytes
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();

      // Convert bytes to base64
      String base64Image = base64Encode(Uint8List.fromList(imageBytes));

      return base64Image;
    } catch (e) {
      print('Error converting image to base64: $e');
      return ''; // Return an empty string or handle the error as needed
    }
  }

  Future<void> uploadStoreImage() async {
    if (sotreImageFile != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = storageReference.putFile(sotreImageFile!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      imageUrl = await taskSnapshot.ref.getDownloadURL();
      update(); // Notify listeners that the state has changed
    } else {
      print('No image selected.');
    }
  }

  Future<void> uploadStoreLicence() async {
    if (storeLicence != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = storageReference.putFile(storeLicence!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      licenceUrl = await taskSnapshot.ref.getDownloadURL();
      update(); // Notify listeners that the state has changed
    } else {
      print('No image selected.');
    }
  }

  void isSelectedService(ServiceModel service) {
    bool serviceExists = serviceName.contains(service.name);

    if (serviceExists) {
      serviceName.remove(service.name);
    } else {
      serviceName.add(service.name);
    }

    service.isTaped.value = !service.isTaped.value;
    print("The value: ${service.isTaped.value}, ${service.name}");
    print(serviceName);

    update();
  }

  onSignup(Vendor vendor) async {
    if (vendorKey.currentState!.validate()) {
      if (serviceName.isEmpty) {
        Get.snackbar("ERROR", "Invalid Data",
            titleText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('حدث خطأ'),
            ),
            messageText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('الرجاء اختيار الخدمات التي تقدمها '),
            ),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
        isEmpty.value = true;
      } else {
        uploadStoreImage();
        uploadStoreLicence();
        print(vendor.title);
        print(vendor.subtitle);
        print(vendor.description);
        print(vendor.tags);
        print(vendor.type);
        print(vendor.address);
        print(vendor.commercialLicense);
        print(vendor.img);
        String base64Image = await imageToBase64(vendor.img);
        print('Base64 Image: $base64Image');
        print(licenceUrl);
        print(imageUrl);
      }
    }
    print(serviceName.isEmpty);
    print(isEmpty.value);
    update();
  }
}
