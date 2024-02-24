import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/login/view/widget/widget_collection/login_partial.dart';
import 'package:evcar/src/feature/register/controller/register_controller.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:evcar/src/feature/register/view/widget/text_widget/register_text.dart';
import 'package:evcar/src/feature/register/view/widget/widget_collectio.dart/user_exist_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../intro_page/view/widget_collection/intro_button.dart';
import '../widget_collectio.dart/register_form_field.dart';

class RegisterWidgets extends StatelessWidget {
  const RegisterWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: const EdgeInsets.all(10),
        height: 0.9 * context.screenHeight,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromRGBO(0, 168, 168, 0.12),
        ),
        child: Form(
          key: controller.fromKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 0.1 * context.screenHeight,
                      child: Image.asset('assets/images/photo2.png')),
                ],
              ),
              SizedBox(
                height: 0.01 * context.screenHeight,
              ),
              RegisterText.mainText(
                'إنشاء حساب',
              ),
              SizedBox(
                height: 0.05 * context.screenHeight,
              ),
              Stack(
                children: [
                  FormWidget(
                    formModel: FormModel(
                      enableText: false,
                      controller: controller.phoneNumber,
                      hintText: 'رقم الموبايل',
                      invisible: false,
                      validator: (phone) => controller.vaildPhoneNumber(phone),
                      type: TextInputType.phone,
                      inputFormat: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onTap: () {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      verticalDivider(),
                      Text(
                        "+962",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.02,
                      ),
                      SizedBox(
                          height: 0.05 * context.screenHeight,
                          child: Image.asset("assets/images/jordan.png")),
                      SizedBox(
                        width: context.screenWidth * 0.02,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 0.02 * context.screenHeight,
              ),
              Obx(
                () => FormWidget(
                  ontap: () {
                    controller.hidePassword();
                  },
                  formModel: FormModel(
                    enableText: false,
                    icon: controller.hide.value == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    controller: controller.password,
                    hintText: 'الرقم السري',
                    invisible: controller.hide.value,
                    validator: (password) => controller.vaildPassword(password),
                    type: TextInputType.visiblePassword,
                    inputFormat: null,
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 0.02 * context.screenHeight,
              ),
              FormWidget(
                formModel: FormModel(
                  enableText: false,
                  controller: controller.username,
                  hintText: 'اسم المستخدم',
                  invisible: false,
                  validator: (name) => controller.validUsername(name),
                  type: TextInputType.name,
                  inputFormat: null,
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 0.02 * context.screenHeight,
              ),
              FormWidget(
                formModel: FormModel(
                  enableText: false,
                  controller: controller.carType,
                  hintText: 'نوع السيارة',
                  invisible: false,
                  validator: (car) => controller.validCar(car),
                  type: TextInputType.name,
                  inputFormat: null,
                  onTap: () {},
                ),
              ),
              const Spacer(),
              IntroPageButton(
                text: 'إنشاء حساب',
                onPressed: () async {
                  bool userExists = await controller.fetchUserExistence(
                      "962${controller.removeLeadingZero(controller.phoneNumber.text)}");

                  print(controller.phoneNumber.text);
                  if (!userExists) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.lightAppColors.bordercolor,
                          ),
                        );
                      },
                    );
                    controller.onSignup(
                        UserModel(
                            phone:
                                "962${controller.removeLeadingZero(controller.phoneNumber.text)}",
                            username: controller.username.text,
                            carType: controller.carType.text,
                            password: controller.password.text),
                        context);
                  } else {
                    userExistDialog(context, ("المستخدم موجود مسبقا"));
                  }
                },
                colorText: AppTheme.lightAppColors.mainTextcolor,
                colorButton: AppTheme.lightAppColors.buttoncolor,
              ),
              SizedBox(height: 0.01 * context.screenHeight),
              SizedBox(
                width: 0.65 * context.screenWidth,
                child: RegisterText.textButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
