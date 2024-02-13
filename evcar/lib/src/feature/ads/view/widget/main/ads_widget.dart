import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/ads/controller/ads_constroller.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/ads_form_container.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/ads_image.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/drive_widget.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/type_widget.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final registerToken = Get.put(UserRegisterController());
    final loginToken = Get.put(LoginController());
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
                // CategoryWidget(),
                // SizedBox(
                //   height: context.screenHeight * 0.02,
                // ),
                TypeWidget(),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                DriveWidget(),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                AdsFormContainer(
                  title: "اسم القطعة",
                  formModel: FormModel(
                      controller: controller.adsName,
                      enableText: false,
                      hintText: "اسم القطعة",
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
                  title: "وصف القطعة ",
                  formModel: FormModel(
                      controller: controller.description,
                      enableText: false,
                      hintText: "وصف القطعة ",
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
                  text: 'حفظ ونشر ',
                  onPressed: () {
                    controller.addAds(
                        registerToken.token.value + loginToken.token.value);
                  },
                  colorText: AppTheme.lightAppColors.mainTextcolor,
                )
              ],
            ),
          ),
        ));
  }
}
