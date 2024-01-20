import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/forget_password/controller/rest_password_controller.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/login/view/widget/text_widget/login_text.dart';
import 'package:evcar/src/feature/login/view/widget/widget_collection/login_form_widget.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestPasswordWidget extends GetView<RestPasswordController> {
  const RestPasswordWidget({required this.phone, super.key});
  final String phone;
  @override
  Widget build(BuildContext context) {
    Get.put(RestPasswordController());
    return Container(
      margin: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: controller.fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginText.mainLoginText('ادخل كلمة السر الجديدة'),
              SizedBox(height: 0.02 * context.screenHeight),
              LoginText.subLoginText(
                'يرجى التأكد من كلمة المرور',
              ),
              SizedBox(
                height: 0.05 * context.screenHeight,
              ),
              Divider(
                height: 1,
                color: AppTheme.lightAppColors.bordercolor,
              ),
              LoginFormWidget(
                formModel: FormModel(
                  enableText: false,
                  icon: null,
                  textAligment: TextAlign.start,
                  controller: controller.newPassword,
                  hintText: 'الرقم السري',
                  invisible: true,
                  validator: (password) => controller.vaildPassword(password),
                  type: TextInputType.visiblePassword,
                  inputFormat: null,
                  onTap: () {},
                ),
              ),
              SizedBox(height: 0.1 * context.screenHeight),
              IntroPageButton(
                text: 'التالي',
                onPressed: () {
                  if (controller.fromKey.currentState!.validate()) {
                    print(phone);
                    controller.makePutRequest(
                        phone: '962$phone',
                        password: controller.newPassword.text);
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
