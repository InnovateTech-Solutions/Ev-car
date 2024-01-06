import 'dart:async';

import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/core/widgets/custem_button.dart';
import 'package:evcar/src/feature/otp/controller/otp_controller.dart';
import 'package:evcar/src/feature/otp/view/widget/otp_subform.dart';
import 'package:evcar/src/feature/otp/view/widget/otp_text.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpWidget extends StatelessWidget {
  OtpWidget({required this.userModel, super.key});

  final UserModel userModel;

  final first = TextEditingController();
  final seconed = TextEditingController();
  final thired = TextEditingController();
  final four = TextEditingController();
  final RxBool ispressed = true.obs;

  @override
  Widget build(BuildContext context) {
    RxInt timer = 0.obs;
    final controller = Get.put(OTPController(userModel.phone));
    void startTimer() {
      ispressed.value = false;
      controller.onButtonPressed();
      // Set the timer for 60 seconds
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
                  'لقد ارسلنا رسالة مصية قصيرة تحتوي على رمز\n  التفعيل إلى هاتفك ${userModel.phone}'),
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
                    inputFormat: null,
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 0.04 * context.screenHeight,
              ),
              Obx(
                () => TextButton(
                  onPressed: () => {
                    // ispressed.value ? controller.onButtonPressed() : null,
                    // ispressed.value = !ispressed.value,
                    // print(ispressed.value)
                    startTimer()
                  },
                  child: ispressed.value
                      ? OtpText.secText('اضغط هنا لارسال الرسالة')
                      : OtpText.theridext('اضغط هنا لارسال الرسالة'),
                ),
              ),
              SizedBox(
                height: 0.04 * context.screenHeight,
              ),
              CustemButton(
                text: 'تأكيد',
                onPressed: () {
                  controller.isMatch(first.text, userModel);
                  print(first.text);
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
