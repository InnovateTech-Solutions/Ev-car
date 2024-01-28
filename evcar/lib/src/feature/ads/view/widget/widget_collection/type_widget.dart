import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/ads/controller/ads_constroller.dart';
import 'package:evcar/src/feature/ads/view/widget/text/ads_text.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/ads_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdsController());

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.03,
          vertical: context.screenHeight * 0.04),
      width: context.screenWidth,
      height: context.screenHeight * 0.2,
      decoration: BoxDecoration(
          color: AppTheme.lightAppColors.background,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdsText.secText("النوع"),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          DropDownMenuWidget(
            list: controller.TypeList,
            value: controller.TypeValue,
          )
        ],
      ),
    );
  }
}
