import 'package:evcar/src/future/login/view/widget/login_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custem_button.dart';
import 'custem_text_form_field.dart';
import '../../../../core/widgets/custem_title_text.dart';

class RegisterWidgets extends StatelessWidget {
  const RegisterWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
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
                  const CustemTitleText(
                    text: 'إنشاء حساب',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  CustomTextFormField(
                    hintText: 'رقم الموبايل',
                    keyboardType: TextInputType.phone,
                    onSave: () {},
                    validator: () {},
                  ),
                  CustomTextFormField(
                    hintText: 'الرقم السري',
                    keyboardType: TextInputType.text,
                    onSave: () {},
                    isPassword: true,
                    validator: () {},
                  ),
                  CustomTextFormField(
                    hintText: 'نوع السيارة',
                    keyboardType: TextInputType.text,
                    onSave: () {},
                    validator: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  CustemButton(
                    text: 'إنشاء حساب',
                    onPressed: () {},
                    colorText: Colors.white,
                    colorButton: const Color.fromRGBO(0, 168, 168, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
