import 'package:evcar/src/core/widget/text_widget/text_widget.dart';
import 'package:evcar/src/future/ads/widget/custom_app_bar_ads.dart';
import 'package:evcar/src/future/ads/widget/details_ads_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_button_type_ads_widget.dart';

class StateOfItem extends StatelessWidget {
  const StateOfItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarAds(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .04,
          horizontal: MediaQuery.of(context).size.width * .04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Styles.textstyle28(
              'الحالة',
              Colors.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            CustomBottunTypeAdsWidget(
              text: 'مستعمل',
              onTap: () {
                Get.to(const DetailsAdsWidget());
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            CustomBottunTypeAdsWidget(
              text: 'جديد',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
