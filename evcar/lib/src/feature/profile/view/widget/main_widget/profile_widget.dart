import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/feature/home_page/controller/home_controller.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/information_page/controller/profile_controller.dart';
import 'package:evcar/src/feature/profile/view/widget/widget_collection/user_card.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget_collection/profile_button_profile.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final registerToken = Get.put(UserRegisterController());
  final loginToken = Get.put(LoginController());
  final homeController = Get.put(HomePageController());
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
        UserCard(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .03,
        ),
        ProfileButton(
          onTap: () => Get.toNamed(AppRoutes.informatioPage),
          title: 'المعلومات الشخصية',
          icon: Icons.person_outline_outlined,
        ),
        ProfileButton(
          onTap: () {
            Get.to(Scaffold());
          },
          title: 'المفضلة',
          icon: Icons.favorite_border,
        ),
        ProfileButton(
          onTap: () => Get.toNamed(AppRoutes.connectUs),
          title: 'اتصل بنا',
          icon: Icons.account_box_outlined,
        ),
        ProfileButton(
          onTap: () => Get.toNamed(AppRoutes.aboutUs),
          title: 'عن التطبيق',
          icon: Icons.error_outline_outlined,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .06,
        ),
        MaterialButton(
          onPressed: () {
            registerToken.token.value = '';
            loginToken.token.value = '';
            Get.offAllNamed(AppRoutes.spalshPage);
            homeController.logout();
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
