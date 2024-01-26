import 'package:evcar/src/core/widget/text_widget/text_widget.dart';
import 'package:evcar/src/future/ads/widget/custom_app_bar_ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_button_type_ads_widget.dart';
import 'delivery_widget.dart';

class TypeAdsWidget extends StatelessWidget {
  const TypeAdsWidget({super.key});

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
              'النوع',
              Colors.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            CustomBottunTypeAdsWidget(
              text: 'بطاريات',
              onTap: () {
                Get.to(DeliveryScreen());
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .025,
            ),
            CustomBottunTypeAdsWidget(
              text: 'قطع هيكل',
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .025,
            ),
            CustomBottunTypeAdsWidget(
              text: 'قطع تعديل',
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .025,
            ),
            CustomBottunTypeAdsWidget(
              text: 'قطع ميكانيك',
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .025,
            ),
            CustomBottunTypeAdsWidget(
              text: 'إكسسوارات',
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .025,
            ),
            CustomBottunTypeAdsWidget(
              text: 'أخرى',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
