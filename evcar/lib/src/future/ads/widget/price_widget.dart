import 'package:evcar/src/future/ads/widget/custom_app_bar_ads.dart';
import 'package:evcar/src/future/ads/widget/custom_text_form_ads_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/text_widget/text_widget.dart';
import '../../../core/widgets/custem_button.dart';
import 'number_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

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
              Styles.textstyle28('ما السعر ؟', Colors.black),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Styles.textstyle24('أختر العملة', Colors.black),
              MaterialButton(
                  onPressed: () {},
                  color: const Color.fromRGBO(232, 252, 252, 1),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  child: Styles.textstyle20('دينار', Colors.black)),
              SizedBox(
                height: MediaQuery.of(context).size.height * .08,
              ),
              Styles.textstyle24('السعر', Colors.black),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              const CustomTextFormAdsWidget(
                text: 'أضف السعر الكامل',
                num: null,
                value: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
              ),
              CustemButton(
                text: 'التالي',
                colorText: Colors.white,
                colorButton: const Color.fromRGBO(0, 168, 168, 1),
                onPressed: () {
                  Get.to(const NumberWidget());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
