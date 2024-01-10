import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/core/constants/constants.dart';
import 'package:evcar/src/feature/about/view/about_page.dart';
import 'package:evcar/src/feature/contact/view/contact_page.dart';
import 'package:evcar/src/feature/favorite/view/favorite_page.dart';
import 'package:evcar/src/feature/login/view/widget/login_widget.dart';
import 'package:evcar/src/feature/profile/controller/profile_controller.dart';
import 'package:evcar/src/feature/profile/view/widget/text_widget.dart';
import 'package:evcar/src/feature/register/controller/register_subcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/information_page.dart';
import 'custom_button_profile.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final controller = Get.put(TokenController());
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
        Obx(
          () => FutureBuilder(
              future: profileController.getUserDetails(
                  registerToken.token.value + loginToken.token.value),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .12,
                        margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .06,
                          vertical: MediaQuery.of(context).size.height * .02,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffDFDFDF),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * .04),
                          child: Row(
                            children: [
                              Container(
                                width: context.screenWidth * 0.2,
                                height: context.screenHeight * 0.1,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: context.screenWidth * 0.005,
                                        color: AppTheme
                                            .lightAppColors.bordercolor),
                                    shape: BoxShape.circle,
                                    color: AppTheme.lightAppColors.background),
                                child: Center(
                                  child: Icon(
                                    Icons.person_2_outlined,
                                    size: context.screenWidth * 0.15,
                                    color: AppTheme.lightAppColors.bordercolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Styles.textstyle19(snapshot.data!.username),
                                  Styles.textstyle12('معلومات الحساب'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Text('Error: ${snapshot.error}');
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              }),
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
            Get.to(FavoritePage());
          },
          title: 'المفضلة',
          icon: Icons.favorite_border,
        ),
        CustomButtonProfile(
          onTap: () {
            Get.to(const ContactPage());
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
