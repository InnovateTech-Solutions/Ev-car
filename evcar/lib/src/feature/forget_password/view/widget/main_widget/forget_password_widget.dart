import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/forget_password/controller/forget_password_controller.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/login/view/widget/text_widget/login_text.dart';
import 'package:evcar/src/feature/login/view/widget/widget_collection/login_form_widget.dart';
import 'package:evcar/src/feature/login/view/widget/widget_collection/login_partial.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgetPasswordWidget extends GetView<ForgetPasswordController> {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: controller.fromKey,
        child: Column(
          children: [
            LoginText.mainLoginText('هل نسين كلمة السر ؟'),
            SizedBox(height: 0.02 * context.screenHeight),
            LoginText.subLoginText(
              'يرجى ادخال رقمك لارسال لك رسالة تحتوي على رمز التفعيل .',
            ),
            SizedBox(height: 0.05 * context.screenHeight),
            Row(
              children: [
                Expanded(
                  child: LoginFormWidget(
                    formModel: FormModel(
                        controller: controller.phone,
                        enableText: false,
                        textAligment: TextAlign.end,
                        hintText: '0000 000 000',
                        invisible: false,
                        validator: (phone) =>
                            controller.validatePhoneNumber(phone),
                        type: TextInputType.phone,
                        inputFormat: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onTap: null),
                  ),
                ),
                verticalDivider(),
                Column(
                  children: [
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    LoginText.subLoginText('962+'),
                    SizedBox(
                      height: context.screenHeight * 0.015,
                    ),
                    Container(
                      width: context.screenWidth * 0.1,
                      height: 1,
                      color: AppTheme.lightAppColors.bordercolor,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: context.screenHeight * 0.1),
            IntroPageButton(
              text: 'التالي',
              onPressed: () async {
                controller.onSignup(
                    controller.removeLeadingZero(controller.phone.text),
                    context);
              },
              colorText: AppTheme.lightAppColors.mainTextcolor,
              colorButton: AppTheme.lightAppColors.buttoncolor,
            )
          ],
        ),
      ),
    );
  }
}
