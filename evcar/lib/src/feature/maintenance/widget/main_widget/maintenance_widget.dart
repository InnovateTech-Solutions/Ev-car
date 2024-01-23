import 'package:evcar/src/feature/information_page/controller/profile_controller.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/appbar_widget/maintenance_appbar.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/parts/most_wanted_widget.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/search/maintenance_search.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/services/services_widget.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/maintenance/widget/top_rated/top_rated_widget.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaintenanceWidget extends StatefulWidget {
  const MaintenanceWidget({super.key});

  @override
  State<MaintenanceWidget> createState() => _MaintenanceWidgetState();
}

class _MaintenanceWidgetState extends State<MaintenanceWidget> {
  final profileController = Get.put(ProfileController());
  final registerToken = Get.put(UserRegisterController());
  final loginToken = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .06,
        vertical: MediaQuery.of(context).size.height * .02,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //appBar
            MaintenanceAppBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            //Search
            MaintenanceSearch(
              search: SearchFormEntitiy(
                  hintText: "إبحث", type: TextInputType.name, onChange: null),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            // our services
            MaintenanceText.seeMore("خدماتنا"),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            ServicesWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            // Top Rated
            MaintenanceText.seeMore("الاعلى تقييما"),
            TopRatedWidget(),
            // the most wanted
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            MaintenanceText.seeMore('الأكثر طلبا'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            MostWantedWidget()
          ],
        ),
      ),
    );
  }
}
