import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_button.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_search.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_text.dart';
import 'package:evcar/src/future/on_board/view/widget/on_boarding_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/google_map_controller.dart';

googleMapContainer(double screenWidth, BuildContext context) {
  final mapController = Get.put(MapController());

  return Obx(
    () => Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: mapController.isExpanded.value == true
            ? MediaQuery.of(context).size.height
            : 0.9 * screenWidth,
        height: mapController.isExpanded.value == true
            ? MediaQuery.of(context).size.height
            : 0.6 * screenWidth,
        padding: EdgeInsets.all(
          0.05 * screenWidth,
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
                secText(" "),
                SvgPicture.asset(
                  "asset/currentLocation.svg",
                  width: 0.07 * screenWidth,
                  height: 0.07 * screenWidth,
                ),
                const Spacer(),
                mapSecText("قاعدة \nشحن سريع"),
                SizedBox(
                  width: 0.02 * screenWidth,
                ),
                SvgPicture.asset(
                  "asset/chargeIcon.svg",
                  width: 0.07 * screenWidth,
                ),
                mapController.isExpanded.value == true
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        color: AppTheme.lightAppColors.background,
                        onPressed: () {
                          mapController.isExpanded.value = false;
                        },
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 0.03 * screenWidth,
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
                    height: 0.03 * screenWidth,
                  ),
            Divider(
              thickness: 2,
              height: 0.09 * screenWidth,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                    onTap: () {},
                    title: "تركيب نقطة شحن",
                    color: AppTheme.lightAppColors.primary),
                SizedBox(
                  width: 0.05 * screenWidth,
                ),
                ButtonWidget(
                    onTap: () {},
                    title: "الشحن المتنقل",
                    color: AppTheme.lightAppColors.buttoncolor),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
