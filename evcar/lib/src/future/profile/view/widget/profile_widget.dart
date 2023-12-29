import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/information_page.dart';
import 'custom_button_profile.dart';
import 'custom_cart_profile.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomCartProfile(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .03,
        ),
        CustomButtonProfile(
          onTap: () {
            Get.to(const InformationPage());
          },
          title: 'المعلومات الشخصية',
          icon: Icons.person_outline_outlined,
        ),
        CustomButtonProfile(
          onTap: () {},
          title: 'المفضلة',
          icon: Icons.favorite_border,
        ),
        CustomButtonProfile(
          onTap: () {},
          title: 'الإشعارات',
          icon: Icons.notifications_outlined,
        ),
        CustomButtonProfile(
          onTap: () {},
          title: 'اللغة',
          icon: Icons.language_outlined,
        ),
        CustomButtonProfile(
          onTap: () {},
          title: 'اتصل بنا',
          icon: Icons.account_box_outlined,
        ),
        CustomButtonProfile(
          onTap: () {},
          title: 'عن التطبيق',
          icon: Icons.error_outline_outlined,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .06,
        ),
        MaterialButton(
          onPressed: () {},
          height: MediaQuery.of(context).size.height * .06,
          shape: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(223, 223, 223, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'تسجيل الخروج',
            style: TextStyle(
              color: Color.fromRGBO(224, 45, 88, 1),
              fontSize: 16,
              fontFamily: 'Cairo-Medium',
            ),
          ),
        ),
      ],
    );
  }
}