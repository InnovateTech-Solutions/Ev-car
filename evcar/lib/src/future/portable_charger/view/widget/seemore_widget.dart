import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/charging_station/view/widget/detail_page_text.dart';
import 'package:evcar/src/future/portable_charger/model/portable_charger.dart';
import 'package:evcar/src/future/portable_charger/view/widget/portable_charger_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Column chargerTypeContainer(
    BuildContext context, RxBool seeMore, PortableChargerModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      seeMore.value == true
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PortableChargerText.secText("أنواع الشواحن"),
                Container(
                  height: 0.1 * context.screenHeight,
                  width: 0.45 * context.screenWidth,
                  padding: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black.withOpacity(0.2))),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.chargerType.length + 1,
                    separatorBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset(
                              "assets/images/${model.chargerType[index]}.png"),
                          DetailText.chargeText(model.chargerType[index])
                        ],
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 0.02 * context.screenWidth);
                    },
                  ),
                ),
              ],
            )
          : Container(),
      InkWell(
        onTap: () {
          if (seeMore.isTrue) {
            seeMore.value = false;
          } else {
            seeMore.value = true;
          }
        },
        child: Obx(
          () => Text(
            seeMore.value == false ? 'مزيد ...' : 'اقل ...',
            style: TextStyle(
              color: AppTheme.lightAppColors.buttoncolor,
              fontFamily: 'cairo-Medium',
            ),
          ),
        ),
      ),
    ],
  );
}
