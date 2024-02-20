import 'dart:convert';

import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/basic_info/view/page/basic_info_page.dart';
import 'package:evcar/src/feature/home_page/controller/home_controller.dart';
import 'package:evcar/src/feature/information_page/controller/profile_controller.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorAppBar extends StatefulWidget {
  const VendorAppBar({super.key});

  @override
  State<VendorAppBar> createState() => _ProductAppBarState();
}

class _ProductAppBarState extends State<VendorAppBar> {
  Future<Vendor> getUserDetails(String token) async {
    print(token);
    final response = await http.get(
      Uri.parse(ApiKey.getVendorDetails),
      headers: {
        'Authorization': 'Bearer  $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final Vendor vendor = Vendor.fromMap(responseData);

      return vendor;
    } else {
      throw Exception('Failed to load user details');
    }
  }

  final profileController = Get.put(ProfileController());
  final registerToken = Get.put(UserRegisterController());
  final homeController = Get.put(HomePageController());

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
        future:
            getUserDetails(registerToken.token.value + loginToken.token.value),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () => {Get.to(BasicInformationPage())},
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(snapshot.data!.img),
                    ),
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
                      MaintenanceText.appBarMainText(snapshot.data!.title),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .03,
                  ),
                  IconButton(
                      onPressed: () => {
                            registerToken.token.value = '',
                            loginToken.token.value = '',
                            Get.offAllNamed(AppRoutes.spalshPage),
                            homeController.logout()
                          },
                      icon: Icon(Icons.logout))
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
