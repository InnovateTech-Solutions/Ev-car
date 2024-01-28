import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/ads/view/widget/text/ads_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownMenuWidget extends StatelessWidget {
  const DropDownMenuWidget(
      {super.key, required this.list, required this.value});
  final List<String> list;
  final RxString value;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: context.screenHeight * 0.07,
          padding: EdgeInsets.only(
            right: context.screenWidth * 0.05,
          ),
          width: context.screenWidth * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.lightAppColors.bordercolor),
          ),
          child: DropdownButton<String>(
            value: value.value,
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppTheme.lightAppColors.subTextcolor,
            ),
            iconSize: 24,
            elevation: 16,
            underline: SizedBox(),
            onChanged: (String? newValue) {
              value.value = newValue!;
            },
            items: list.map<DropdownMenuItem<String>>((String vv) {
              return DropdownMenuItem<String>(
                value: vv,
                child: AdsText.menuText(vv),
              );
            }).toList(),
          ),
        ));
  }
}
