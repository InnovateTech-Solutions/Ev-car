import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

isFavWidget(RxBool isFav, BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(8),
    child: GestureDetector(
        onTap: () {
          if (isFav.isTrue) {
            isFav.value = false;
          } else {
            isFav.value = true;
          }
        },
        child: Obx(() => isFav.value == false
            ? SvgPicture.asset('assets/images/favFalseIcon.svg')
            : SvgPicture.asset('assets/images/favTrueHeart.svg'))),
  );
}
