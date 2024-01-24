import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorController extends GetxController {
  late final PageController pageController;
  var currentPage = 0.obs;
  var imageCount = 0.obs;
  RxList<bool> buttonPressedList = [true, false, false, false, false].obs;
  RxList<bool> buttonCarsList = [true, false, false, false, false].obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    pageController.addListener(() {
      currentPage.value = pageController.page!.round();
    });
  }

  void updateImageCount(List<String>? images) {
    if (images != null) {
      imageCount.value = images.length;
    }
  }

  void changeButtonColor(int index) {
    for (int i = 0; i < buttonPressedList.length; i++) {
      buttonPressedList[i] = (i == index);
    }
  }

  void changeColor(int index) {
    for (int i = 0; i < buttonCarsList.length; i++) {
      buttonCarsList[i] = (i == index);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
