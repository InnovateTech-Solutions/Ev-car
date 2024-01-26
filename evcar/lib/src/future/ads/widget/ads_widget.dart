import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_photo_ads_widget.dart';
import 'custom_button_aads_widget.dart';

class AdeWidget extends StatelessWidget {
  const AdeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButtonAdsWidget(
          text: 'إضافة إعلان',
          image: 'assets/images/lets-icons_img-box-duotone.png',
          onTap: () {
            Get.to(
              const AddPhotoAdsWidget(),
            );
          },
        ),
        CustomButtonAdsWidget(
          text: 'إضافة خدمة',
          image: 'assets/images/wpf_maintenance.png',
          onTap: () {},
        ),
      ],
    );
  }
}
