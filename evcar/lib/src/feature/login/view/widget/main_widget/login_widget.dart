// ignore_for_file: avoid_print

import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/login/view/widget/widget_collection/login_form_widget.dart';
import 'package:evcar/src/feature/login/view/widget/widget_collection/login_partial.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:evcar/src/feature/vendor_login/view/page/vendor_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../text_widget/login_text.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: controller.fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginText.mainLoginText('تسجيل الدخول'),
              SizedBox(height: 0.02 * context.screenHeight),
              LoginText.subLoginText(
                'يرجى تأكيد رمز البلد الخاص بك وإدخال رقم هاتفك.',
              ),
              SizedBox(
                height: 0.05 * context.screenHeight,
              ),
              Divider(
                height: 1,
                color: AppTheme.lightAppColors.bordercolor,
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: LoginText.subLoginText(
                  'الاردن',
                ),
              ),
              Divider(
                height: 1,
                color: AppTheme.lightAppColors.bordercolor,
              ),
              Row(
                children: [
                  Expanded(
                    child: LoginFormWidget(
                      formModel: FormModel(
                          controller: controller.phoneController,
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
                      Row(
                        children: [
                          LoginText.subLoginText('962+'),
                          SizedBox(
                            width: context.screenWidth * 0.01,
                          ),
                          SizedBox(
                              height: context.screenHeight * 0.03,
                              child: Image.asset("assets/images/jordan.png")),
                        ],
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.015,
                      ),
                      Container(
                        width: context.screenWidth * 0.15,
                        height: 1,
                        color: AppTheme.lightAppColors.bordercolor,
                      )
                    ],
                  )
                ],
              ),
              LoginFormWidget(
                formModel: FormModel(
                  enableText: false,
                  icon: null,
                  textAligment: TextAlign.start,
                  controller: controller.passwordController,
                  hintText: 'الرقم السري',
                  invisible: true,
                  validator: (password) => controller.vaildPassword(password),
                  type: TextInputType.visiblePassword,
                  inputFormat: null,
                  onTap: () {},
                ),
              ),
              SizedBox(height: 0.020 * context.screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoginText.forgetPassword('هل نسيت كلمة السر ؟',
                      () => Get.toNamed(AppRoutes.forgetPassword)),
                  LoginText.forgetPassword(
                      'مزود خدمة ', () => Get.to(VendorLoginPage()))
                ],
              ),
              SizedBox(height: 0.1 * context.screenHeight),
              IntroPageButton(
                text: 'التالي',
                onPressed: () async {
                  if (controller.fromKey.currentState!.validate()) {
                    await controller.postUser();
                  }
                },
                colorText: AppTheme.lightAppColors.mainTextcolor,
                colorButton: AppTheme.lightAppColors.buttoncolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
