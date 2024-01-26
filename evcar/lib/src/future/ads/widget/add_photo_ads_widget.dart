import 'package:evcar/src/core/widget/text_widget/text_widget.dart';
import 'package:evcar/src/future/ads/widget/custom_app_bar_ads.dart';
import 'package:evcar/src/future/ads/widget/type_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custem_button.dart';
import '../../../core/widgets/custom_bottun_add_photo.dart';

class AddPhotoAdsWidget extends StatelessWidget {
  const AddPhotoAdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarAds(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .04,
            horizontal: MediaQuery.of(context).size.width * .04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.textstyle28(
                'أضافة صورة للإعلان',
                Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .68,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return CustomAddPhotoBottun(
                      image: 'assets/images/mdi_camera.png',
                      onTap: () {},
                    );
                  },
                ),
              ),
              Center(
                child: CustemButton(
                  text: 'التالي',
                  colorButton: const Color.fromRGBO(0, 168, 168, 1),
                  colorText: Colors.white,
                  onPressed: () {
                    Get.to(const TypeAdsWidget());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
