import 'package:evcar/src/core/widget/text_widget/text_widget.dart';
import 'package:evcar/src/future/ads/widget/custom_app_bar_ads.dart';
import 'package:evcar/src/future/ads/widget/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custem_button.dart';
import 'custom_text_form_ads_widget.dart';

class DetailsAdsWidget extends StatelessWidget {
  const DetailsAdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarAds(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .04,
          horizontal: MediaQuery.of(context).size.width * .04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.textstyle28('ما هي تفاصيل الإعلان؟', Colors.black),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              const CustomTextFormAdsWidget(
                text: 'إسم الإعلان',
                num: 100,
                value: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              const CustomTextFormAdsWidget(
                text: 'وصف الإعلان',
                num: 5000,
                value: 100,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .18,
              ),
              CustemButton(
                text: 'التالي',
                colorText: Colors.white,
                colorButton: const Color.fromRGBO(0, 168, 168, 1),
                onPressed: () {
                  Get.to(const PriceWidget());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
