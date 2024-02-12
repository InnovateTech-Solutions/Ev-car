import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/information_page/controller/profile_controller.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorAppBar extends StatefulWidget {
  const VendorAppBar({super.key});

  @override
  State<VendorAppBar> createState() => _ProductAppBarState();
}

class _ProductAppBarState extends State<VendorAppBar> {
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
                      "مركز صيانة",
                    ),
                    MaintenanceText.appBarMainText(snapshot.data!.username),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.logout_rounded)),
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
