import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/ads/controller/ads_constroller.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/ads_form_container.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/ads_image.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/category_widget.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/drive_widget.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/type_widget.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdsController());

    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.05,
            vertical: context.screenHeight * 0.01),
        child: SingleChildScrollView(
          child: Form(
            key: controller.fromKey,
            child: Column(
              children: [
                AdsImage(),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                CategoryWidget(),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                TypeWidget(),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                DriveWidget(),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                AdsFormContainer(
                  title: "اسم الاعلان",
                  formModel: FormModel(
                      controller: controller.adsName,
                      enableText: false,
                      hintText: "اسم الاعلان",
                      invisible: false,
                      validator: (name) => controller.validAdsName(name),
                      type: TextInputType.name,
                      inputFormat: null,
                      onTap: () {}),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                AdsFormContainer(
                  title: "وصف الاعلان ",
                  formModel: FormModel(
                      controller: controller.description,
                      enableText: false,
                      hintText: "وصف الاعلان ",
                      invisible: false,
                      validator: (phone) => controller.validDescription(phone),
                      type: TextInputType.name,
                      inputFormat: null,
                      onTap: () {}),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                AdsFormContainer(
                  title: "السعر",
                  formModel: FormModel(
                      controller: controller.price,
                      enableText: false,
                      hintText: "السعر",
                      invisible: false,
                      validator: (price) => controller.priceValid(price),
                      type: TextInputType.number,
                      inputFormat: null,
                      onTap: () {}),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                AdsFormContainer(
                  title: "رقم الهاتف",
                  formModel: FormModel(
                      controller: controller.phone,
                      enableText: false,
                      hintText: "رقم الهاتف",
                      invisible: false,
                      validator: (phone) => controller.vaildPhoneNumber(phone),
                      type: TextInputType.number,
                      inputFormat: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onTap: () {}),
                ),
                SizedBox(
                  height: context.screenHeight * 0.03,
                ),
                IntroPageButton(
                  colorButton: Color(0xffCA7A02),
                  text: 'حفظ ونشر الإعلان',
                  onPressed: () {
                    if (controller.fromKey.currentState!.validate()) {
                      print(controller.adsImage.length);
                      print(controller.adsName.text);
                      print(controller.description.text);
                      print(controller.phone.text);
                      print(controller.price.text);
                      print(controller.TypeValue);
                      print(controller.driveValue);
                    } else {
                      Get.snackbar(
                        "ERROR",
                        "Invalid Data",
                        titleText: Align(
                          alignment:
                              Alignment.topRight, // Set your desired alignment
                        ),
                      );
                    }
                  },
                  colorText: AppTheme.lightAppColors.mainTextcolor,
                )
              ],
            ),
          ),
        ));
  }
}
