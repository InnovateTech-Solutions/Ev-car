import 'package:evcar/src/future/ads/widget/custom_app_bar_ads.dart';
import 'package:evcar/src/future/ads/widget/save_ads_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widget/text_widget/text_widget.dart';
import '../../../core/widgets/custem_button.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({super.key});

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
            Styles.textstyle30('رقم الهاتف'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .3,
            ),
            CustemButton(
              text: 'التالي',
              colorText: Colors.white,
              colorButton: const Color.fromRGBO(0, 168, 168, 1),
              onPressed: () {
                Get.to(const SaveAdsWidget());
              },
            ),
          ],
        ),
      ),
    );
  }
}
