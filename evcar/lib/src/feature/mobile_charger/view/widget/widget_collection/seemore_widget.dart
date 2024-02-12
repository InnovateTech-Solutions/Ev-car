import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_page_text.dart';
import 'package:evcar/src/feature/home_charging_station/model/charging_model.dart';
import 'package:evcar/src/feature/mobile_charger/view/widget/text/mobile_charger_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../maintenance/widget/maintenance_partial/parts/most_wanted_container.dart';

Column chargerTypeContainer(
    BuildContext context, RxBool seeMore, ChargingStation model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      seeMore.value == true
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MobileChargerText.secText("أنواع الشواحن"),
                Container(
                  height: 0.1 * context.screenHeight,
                  width: 0.45 * context.screenWidth,
                  padding: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black.withOpacity(0.2))),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.chargers!.length + 1,
                    separatorBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.network(model.chargers![index].image),
                          DetailText.chargeText(
                              shortenText(model.chargers![index].title))
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
