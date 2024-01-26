import 'package:evcar/src/future/ads/widget/state_of_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widget/text_widget/text_widget.dart';
import '../controller/ads_controller.dart';
import 'custom_app_bar_ads.dart';
import 'delivery_button.dart';

class DeliveryScreen extends StatelessWidget {
  DeliveryScreen({super.key});

  final AdsController controller = Get.put(AdsController());

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
            Styles.textstyle28('هل لديك خدمة توصيل ؟', Colors.black),
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            DeliveryButton(
              text: 'نعم',
              onTap: () {
                controller.buttonColor.value = Colors.green;
                Get.to(() => const StateOfItem());
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            DeliveryButton(
              text: 'لا',
              onTap: () {
                controller.buttonColor.value = Colors.green;
                Get.to(() => const StateOfItem());
              },
            ),
          ],
        ),
      ),
    );
  }
}
