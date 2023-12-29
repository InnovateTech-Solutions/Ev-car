import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/charging_station/model/detail_model.dart';
import 'package:evcar/src/future/charging_station/view/page/detail_page.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_button.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Column customWindow(
  ChargingStationModel detailModel,
  VoidCallback onTap,
) {
  return Column(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.only(top: 10, right: 10),
          decoration: BoxDecoration(
            color: AppTheme.lightAppColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoWindoMainText("توب لنقاط الشحن"),
              infoWindoMainText("عمان - القويسمة"),
              const Spacer(),
              Row(
                children: [
                  infoWindoSecText("احصل على الاتجاهات", onTap),
                  SizedBox(
                    width: 60,
                    height: 25,
                    child: ButtonWidget(
                        onTap: () {
                          Get.to(DetailPage(detailModel: detailModel));
                        },
                        title: "تفاصيل",
                        color: AppTheme.lightAppColors.buttoncolor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ],
  );
}