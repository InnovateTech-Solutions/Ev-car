import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/information_page/controller/profile_controller.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAppBar extends StatefulWidget {
  const ProductAppBar({super.key});

  @override
  State<ProductAppBar> createState() => _ProductAppBarState();
}

class _ProductAppBarState extends State<ProductAppBar> {
  final profileController = Get.put(ProfileController());
  final registerToken = Get.put(UserRegisterController());

  final loginToken = Get.put(LoginController());
  @override
  void initState() {
    super.initState();
    registerToken.loadToken();
    loginToken.loadToken();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: profileController
          .getUserDetails(registerToken.token.value + loginToken.token.value),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaintenanceText.appBarSecText(
                      'صباح الخير,',
                    ),
                    MaintenanceText.appBarMainText(snapshot.data!.username),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_forward),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .03,
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.lightAppColors.bordercolor,
              ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppTheme.lightAppColors.bordercolor,
            ),
          );
        }
      },
    );
  }
}
