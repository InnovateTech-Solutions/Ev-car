import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/core/widgets/custem_button.dart';
import 'package:evcar/src/future/login/controller/login_controller.dart';
import 'package:evcar/src/future/login/view/widget/login_form_widget.dart';
import 'package:evcar/src/future/login/view/widget/login_partial.dart';
import 'package:evcar/src/future/register/model/form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'login_text.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
              LoginText.mainText('تسجيل الدخول'),
              SizedBox(
                height: 0.02 * context.screenHeight,
              ),
              LoginText.secText(
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
                child: LoginText.secText(
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
                          controller: controller.phoneNumber,
                          enableText: false,
                          textAligment: TextAlign.end,
                          hintText: '0000 000 000',
                          invisible: true,
                          validator: (password) =>
                              controller.vaildPassword(password),
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
                      LoginText.secText('962+'),
                      SizedBox(
                        height: context.screenHeight * 0.015,
                      ),
                      Container(
                        width: context.screenWidth * 0.1,
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
                  controller: controller.password,
                  hintText: 'الرقم السري',
                  invisible: false,
                  validator: (password) => controller.vaildPassword(password),
                  type: TextInputType.visiblePassword,
                  inputFormat: null,
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 0.1 * context.screenHeight,
              ),
              CustemButton(
                text: 'التالي',
                onPressed: () {
                  controller.postUser(
                      controller.removeLeadingZero(
                          controller.phoneNumber.text.trim()),
                      controller.password.text.trim());
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
