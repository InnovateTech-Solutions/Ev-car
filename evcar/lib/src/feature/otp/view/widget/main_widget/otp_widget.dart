import 'dart:async';

import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/otp/controller/otp_controller.dart';
import 'package:evcar/src/feature/otp/view/widget/text_widget/otp_text.dart';
import 'package:evcar/src/feature/otp/view/widget/widget_collection/otp_subform.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpWidget extends StatelessWidget {
  OtpWidget({required this.userModel, super.key});

  final UserModel userModel;

  final first = TextEditingController();
  final seconed = TextEditingController();
  final thired = TextEditingController();
  final four = TextEditingController();
  final RxBool ispressed = true.obs;

  final subRegisterController = Get.put(UserRegisterController());

  @override
  Widget build(BuildContext context) {
    RxInt timer = 0.obs;
    final controller = Get.put(OTPController(userModel.phone));
    void startTimer() {
      ispressed.value = false;
      controller.onButtonPressed();

      Timer(const Duration(seconds: 30), () {
        ispressed.value = true;
        timer.value;
      });
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              OtpText.mainText('تأكيد رقم الموبايل'),
              SizedBox(
                height: 0.1 * context.screenHeight,
              ),
              OtpText.secText(
                  'لقد ارسلنا رسالة نصية قصيرة تحتوي على رمز\n  التفعيل إلى هاتفك 00${userModel.phone}'),
              SizedBox(
                height: 0.05 * context.screenHeight,
              ),
              SizedBox(
                height: 0.1 * context.screenHeight,
                width: 0.9 * context.screenWidth,
                child: OTPFormWidget(
                  formModel: FormModel(
                    enableText: false,
                    controller: first,
                    hintText: 'OTP Code',
                    invisible: false,
                    validator: null,
                    type: TextInputType.phone,
                    inputFormat: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 0.04 * context.screenHeight,
              ),
              Obx(
                () => TextButton(
                  onPressed: () => {ispressed.value ? startTimer() : null},
                  child: ispressed.value
                      ? OtpText.secText('اضغط هنا لارسال الرسالة')
                      : OtpText.theridext('اضغط هنا لارسال الرسالة'),
                ),
              ),
              SizedBox(
                height: 0.04 * context.screenHeight,
              ),
              IntroPageButton(
                text: 'تأكيد',
                onPressed: () async {
                  bool isMatchResult = await controller.isMatch(first.text);

                  if (isMatchResult) {
                    subRegisterController.postUser(userModel);
                  }
                },
                colorText: AppTheme.lightAppColors.mainTextcolor,
                colorButton: AppTheme.lightAppColors.buttoncolor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
