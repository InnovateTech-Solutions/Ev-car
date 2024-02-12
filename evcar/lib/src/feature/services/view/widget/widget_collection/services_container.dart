import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/vendor_services_controller.dart';

class ServicesListContainer extends StatelessWidget {
  const ServicesListContainer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorServiceaController());

    return GestureDetector(onTap: () {
      controller.click(title);
    }, child: Obx(() {
      final isSelected = controller.servicesList.contains(title);
      return Container(
        margin: EdgeInsets.all(5),
        width: context.screenWidth * 0.01,
        height: context.screenHeight * 0.005,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.lightAppColors.buttoncolor),
          borderRadius: BorderRadius.circular(15),
          color: isSelected
              ? AppTheme.lightAppColors.buttoncolor
              : AppTheme.lightAppColors.mainTextcolor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'cairo-Bold',
              color: isSelected
                  ? AppTheme.lightAppColors.mainTextcolor
                  : AppTheme.lightAppColors.buttoncolor,
            ),
          ),
        ),
      );
    }));
  }
}
