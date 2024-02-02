import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/information_page/controller/profile_controller.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaintenanceAppBar extends StatefulWidget {
  const MaintenanceAppBar({super.key});

  @override
  State<MaintenanceAppBar> createState() => _MaintenanceAppBarState();
}

class _MaintenanceAppBarState extends State<MaintenanceAppBar> {
  final profileController = Get.put(ProfileController());
  final registerToken = Get.put(UserRegisterController());

  // final registerToken = Get.put(SubRegisterController());
  final loginToken = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    registerToken.loadToken();
    loginToken.loadToken();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FutureBuilder(
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
                  InkWell(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage('assets/images/heart-circle.png'),
                    ),
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
      ),
    );
  }
}
