import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/vendor_account/model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceContainer extends StatelessWidget {
  const ServiceContainer(
      {required this.service, required this.callback, super.key});
  final ServiceModel service;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Obx(
        () => Container(
          height: context.screenHeight * 0.07,
          width: context.screenWidth * 0.3,
          decoration: BoxDecoration(
              color: service.isTaped.value
                  ? AppTheme.lightAppColors.buttoncolor
                  : AppTheme.lightAppColors.mainTextcolor,
              border: Border.all(color: AppTheme.lightAppColors.buttoncolor),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
              child: Text(
            service.name,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              fontFamily: 'cairo-Regular',
              color: service.isTaped.value
                  ? AppTheme.lightAppColors.mainTextcolor
                  : AppTheme.lightAppColors.buttoncolor,
            ),
          )),
        ),
      ),
    );
  }
}
