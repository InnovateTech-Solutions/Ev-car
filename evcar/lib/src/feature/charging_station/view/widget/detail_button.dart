import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/portable_charger/controller/portable_charger_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustemButtonCall extends StatelessWidget {
  const CustemButtonCall({super.key, required this.title, required this.phone});
  final String title;
  final String phone;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PortableChargerController());

    return MaterialButton(
      minWidth: 0.35 * MediaQuery.of(context).size.width,
      height: 0.05 * MediaQuery.of(context).size.height,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      color: AppTheme.lightAppColors.buttoncolor,
      onPressed: () {
        controller.launchPhoneCall(phone);
      },
      child: Text(
        title,
        style: TextStyle(
          color: AppTheme.lightAppColors.mainTextcolor,
          fontFamily: 'cairo-Medium',
        ),
      ),
    );
  }
}
