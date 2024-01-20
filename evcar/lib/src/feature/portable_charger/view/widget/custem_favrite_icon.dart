import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

isFavWidget(RxBool isFav, BuildContext contex, ChargingStationModel model) {
  return Container(
    margin: const EdgeInsets.all(8),
    child: GestureDetector(
        onTap: () {},
        child: Obx(() => isFav.value == false
            ? SvgPicture.asset('assets/images/favFalseIcon.svg')
            : SvgPicture.asset('assets/images/favTrueHeart.svg'))),
  );
}
