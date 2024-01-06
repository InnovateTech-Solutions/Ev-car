import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:evcar/src/feature/favorite/controller/add_favritoe.dart';
import 'package:evcar/src/feature/favorite/controller/delete_favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

isFavWidget(RxBool isFav, String chargingStationId, BuildContext context,
    ChargingStationModel model) {
  return Container(
    margin: const EdgeInsets.all(8),
    child: GestureDetector(
      onTap: () {
        if (isFav.isTrue) {
          // If already marked as favorite, delete it
          DeleteFavorite.instance.deleteChargingStation(chargingStationId);
        } else {
          // If not marked as favorite, add it
          // You can pass the ChargingStationModel or its ID, depending on your use case
          // For demonstration, assuming you have access to the ChargingStationModel
          AddFavorite.instance.addChargingStation(model);
        }

        // Toggle the isFav value after handling the add/delete logic
        isFav.value = !isFav.value;
      },
      child: Obx(() => isFav.value == false
          ? SvgPicture.asset('assets/images/favFalseIcon.svg')
          : SvgPicture.asset('assets/images/favTrueHeart.svg')),
    ),
  );
}
