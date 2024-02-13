import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/ads/view/pages/ads_page.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_appbar.dart';
import 'package:evcar/src/feature/vendor_all_product/view/widget/main/vendor_all_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({super.key, required this.id});
  final String id;
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
            child: Icon(
              Icons.add,
              color: AppTheme.lightAppColors.background,
            )),
        appBar: detailAppBar("القطع والاكسسوارات"),
        body: VendorAllProductWidget(
          id: id,
        ),
      ),
    );
  }
}
