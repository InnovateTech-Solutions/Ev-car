import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/ads/view/pages/ads_page.dart';
import 'package:evcar/src/feature/vendor_dashboard/view/widget/main_widget/vendor_dashboard_widget.dart';
import 'package:evcar/src/feature/vendor_dashboard/view/widget/test/vendor_dashboard_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDashboardPage extends StatelessWidget {
  const VendorDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              isExtended: true,
              backgroundColor: AppTheme.lightAppColors.buttoncolor,
              onPressed: () {
                Get.to(AdsPage());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: AppTheme.lightAppColors.background,
                  ),
                  VendorDashboardText.buttonText("إضافة إعلان")
                ],
              )),
          body: Center(
            child: VendorDashboardWidget(),
          )),
    );
  }
}
