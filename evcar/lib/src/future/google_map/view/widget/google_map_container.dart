import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/charging_station/view/page/charging_station_page.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_button.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_search.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_text.dart';
import 'package:evcar/src/future/portable_charger/view/page/portable_charger_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/google_map_controller.dart';

googleMapContainer(BuildContext context) {
  final mapController = Get.put(MapController());

  return Obx(
    () => Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: mapController.isExpanded.value == true
            ? context.width
            : 0.9 * context.screenWidth,
        height: mapController.isExpanded.value == true
            ? context.screenHeight
            : 0.32 * context.height,
        padding: const EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
            color: AppTheme.lightAppColors.primary,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                mapController.isExpanded.value == true
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        color: AppTheme.lightAppColors.background,
                        onPressed: () {
                          mapController.isExpanded.value = false;
                        },
                      )
                    : Container(),
                SvgPicture.asset(
                  "assets/images/chargeIcon.svg",
                  width: 0.07 * context.screenWidth,
                ),
                SizedBox(
                  width: 0.02 * context.screenWidth,
                ),
                mapSecText("قاعدة \nشحن سريع"),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    mapController.getCurrentLocation();
                  },
                  child: SvgPicture.asset(
                    "assets/images/currentLocation.svg",
                    width: 0.07 * context.screenWidth,
                    height: 0.04 * context.screenHeight,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.02 * context.screenHeight,
            ),
            SearchWidget(
              search: SearchFormEntitiy(
                  hintText: "أدخل اسم المحطة",
                  type: TextInputType.text,
                  onChange: null),
            ),
            mapController.isExpanded.value == true
                ? const Spacer()
                : SizedBox(
                    height: 0.01 * context.screenHeight,
                  ),
            Divider(
              thickness: 2,
              height: 0.06 * context.screenHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                    onTap: () {
                      Get.to(const PortableChargerPage());
                    },
                    title: "الشحن المتنقل",
                    color: AppTheme.lightAppColors.buttoncolor),
                SizedBox(
                  width: 0.05 * context.screenWidth,
                ),
                ButtonWidget(
                    onTap: () {
                      Get.to(const ChargingStationPage());
                    },
                    title: "تركيب نقطة شحن",
                    color: AppTheme.lightAppColors.primary),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
