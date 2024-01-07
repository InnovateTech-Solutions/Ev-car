import 'package:evcar/src/feature/favorite/controller/add_favritoe.dart';
import 'package:evcar/src/feature/favorite/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

final controller = Get.put(AddFavorite());
final favoriteController = Get.put(FavoriteController());

isFavWidget(
  RxBool isFav,
  String chargingStationId,
  BuildContext context,
) {
  return Container(
    margin: const EdgeInsets.all(8),
    child: GestureDetector(
      onTap: () {
        controller.addChargingStation(chargingStationId);
        // favoriteController.toggleService();

        isFav.value = true;
      },
      child: Obx(() => isFav.value == false
          ? SvgPicture.asset('assets/images/favFalseIcon.svg')
          : SvgPicture.asset('assets/images/favTrueHeart.svg')),
    ),
  );
}
