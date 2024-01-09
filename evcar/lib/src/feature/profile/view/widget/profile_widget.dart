import 'package:evcar/src/core/constants/constants.dart';
import 'package:evcar/src/feature/about/view/about_page.dart';
import 'package:evcar/src/feature/charging_station/controller/home_controller.dart';
import 'package:evcar/src/feature/contact/view/contact_page.dart';
import 'package:evcar/src/feature/login/view/widget/login_widget.dart';
import 'package:evcar/src/feature/profile/controller/profile_controller.dart';
import 'package:evcar/src/feature/register/controller/register_subcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/information_page.dart';
import 'custom_button_profile.dart';
import 'custom_cart_profile.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final controller = Get.put(TokenController());

  final getToken = Get.put(TokenGetter());
  final registerToken = Get.put(SubRegisterController());
  final loginToken = Get.put(LoginController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    registerToken.loadToken();
    loginToken.loadToken();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCartProfile(
          token: registerToken.token.value + loginToken.token.value,
        ),
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
          onTap: () {
            print(HomeController().isGoogleMapEnabled.value);
            print(controller.loginToken + controller.registerToken);
          },
          title: 'المفضلة',
          icon: Icons.favorite_border,
        ),
        CustomButtonProfile(
          onTap: () {
            Get.to(const ContactPage());
            print(getToken.userToken);
            print(SubRegisterController().token.value);
          },
          title: 'اتصل بنا',
          icon: Icons.account_box_outlined,
        ),
        CustomButtonProfile(
          onTap: () {
            print(controller.concatenatedTokens.value);
            Get.to(const AboutPage());
          },
          title: 'عن التطبيق',
          icon: Icons.error_outline_outlined,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .06,
        ),
        MaterialButton(
          onPressed: () {
            controller.registerToken = '';
            controller.loginToken = '';
            getToken.userToken.value = '';
            controller.clearConcatenatedTokens();
          },
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
