import 'package:evcar/src/future/login/view/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import '../../../../core/widgets/custem_button.dart';

import 'custem_text_form_field.dart';

class RegisterWidgets extends StatelessWidget {
  const RegisterWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 13,
        left: MediaQuery.of(context).size.width / 40,
        right: MediaQuery.of(context).size.width / 40,
      ),
      height: MediaQuery.of(context).size.height / 1.11,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(0, 168, 168, 0.12),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/photo2.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Styles.textstyle30('إنشاء حساب'),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              CustomTextFormField(
                inputFormatter: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                hintText: 'رقم الموبايل',
                keyboardType: TextInputType.phone,
                validator: () {
                  // Add validation for phone number
                },
                onSave: () {},
              ),
              CustomTextFormField(
                hintText: 'الرقم السري',
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                validator: () {
                  // Add validation for password
                },
                onSave: () {},
              ),
              CustomTextFormField(
                hintText: 'نوع السيارة',
                keyboardType: TextInputType.text,
                validator: () {
                  // Add validation for car type
                },
                onSave: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              CustemButton(
                text: 'إنشاء حساب',
                onPressed: () {
                  Get.to(const LoginPage());
                },
                colorText: Colors.white,
                colorButton: const Color.fromRGBO(0, 168, 168, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
