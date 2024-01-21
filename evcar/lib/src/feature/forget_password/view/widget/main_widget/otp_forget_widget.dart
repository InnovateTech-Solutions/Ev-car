import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/forget_password/controller/otp_forget_controller.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/otp/view/widget/text_widget/otp_text.dart';
import 'package:evcar/src/feature/otp/view/widget/widget_collection/otp_subform.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgetOtpWidget extends GetView<ForgetOTPController> {
  const ForgetOtpWidget({required this.number, super.key});

  final String number;
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetOTPController(number));
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
                  'لقد ارسلنا رسالة نصية قصيرة تحتوي على رمز\n  التفعيل إلى هاتفك 00962${number}'),
              SizedBox(
                height: 0.05 * context.screenHeight,
              ),
              SizedBox(
                height: 0.1 * context.screenHeight,
                width: 0.9 * context.screenWidth,
                child: OTPFormWidget(
                  formModel: FormModel(
                    enableText: false,
                    controller: controller.otpTextEditing,
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
                  onPressed: () => {
                    controller.ispressed.value ? controller.startTimer() : null
                  },
                  child: controller.ispressed.value
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
                  bool isMatchResult = await controller.isMatch(
                      controller.otpTextEditing.text, number);
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
