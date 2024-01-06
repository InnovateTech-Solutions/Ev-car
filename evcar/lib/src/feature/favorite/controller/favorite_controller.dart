import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();
  List<ChargingStationModel> favoriteProducts = <ChargingStationModel>[].obs;

  void toggleService(ChargingStationModel station) {
    if (favoriteProducts.contains(station)) {
      favoriteProducts.remove(station);

      update();
      Get.snackbar(
          "you add it before", "${station.title} is aleardy in you favoirate",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppTheme.lightAppColors.mainTextcolor,
          backgroundColor: Colors.red);
    } else {
      favoriteProducts.add(station);
      update();
    }
  }
}
