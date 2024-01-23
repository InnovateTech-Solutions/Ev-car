import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/mobile_charger/controller/mobile_charger_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustemButtonCall extends StatelessWidget {
  CustemButtonCall({
    super.key,
    required this.text,
    required this.phone,
  });

  final String text;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MobileChargerController());

    return GestureDetector(
        onTap: () {
          controller.launchPhoneCall(phone);
        },
        child: Container(
          height: context.screenHeight * 0.035,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppTheme.lightAppColors.buttoncolor),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: AppTheme.lightAppColors.mainTextcolor,
                fontFamily: 'cairo-Medium',
              ),
            ),
          ),
        ));
  }
}
