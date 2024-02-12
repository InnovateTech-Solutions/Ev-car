import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/information_page/controller/profile_controller.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/maintenance/controller/maintenance_controller.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/appbar_widget/maintenance_appbar.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/parts/most_wanted_widget.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/search/maintenance_search.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/services/services_widget.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/top_rated/top_rated_widget.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/maintenance_shop/view/page/maintenance_shop_page.dart';
import 'package:evcar/src/feature/product/view/all_product_page.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:evcar/src/feature/search_shop/view/page/search_page.dart';
import 'package:evcar/src/feature/tags/view/page/all_tags_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaintenanceWidget extends StatefulWidget {
  const MaintenanceWidget({Key? key}) : super(key: key);

  @override
  State<MaintenanceWidget> createState() => _MaintenanceWidgetState();
}

class _MaintenanceWidgetState extends State<MaintenanceWidget> {
  final profileController = Get.put(ProfileController());
  final registerToken = Get.put(UserRegisterController());
  final loginToken = Get.put(LoginController());
  final controller = Get.put(MaintenanceController());

  RxBool _isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      _isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _isLoading.value == true
        ? Center(
            child: CircularProgressIndicator(
              color: AppTheme.lightAppColors.bordercolor,
            ),
          )
        : Container(
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
                  GestureDetector(
                    onTap: () {
                      Get.to(SearchPage());
                    },
                    child: MaintenanceSearch(
                      search: SearchFormEntitiy(
                          hintText: "إبحث",
                          type: TextInputType.name,
                          onChange: null,
                          enableText: true,
                          ontap: () {
                            Get.to(SearchPage(),
                                transition: Transition.downToUp,
                                duration: Duration(milliseconds: 500));
                          }),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  // our services
                  MaintenanceText.seeMore("خدماتنا", () {
                    Get.to(AllTagsPage());
                  }),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "خدماتنا",
                  //       style: const TextStyle(
                  //         fontSize: 22,
                  //         fontWeight: FontWeight.w400,
                  //         fontFamily: 'Cairo-bold',
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  ServicesWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  // Top Rated
                  MaintenanceText.seeMore("المحلات الرائجة", () {
                    Get.to(MaintenanceShopPage());
                  }),
                  TopRatedWidget(),
                  // the most wanted
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  MaintenanceText.seeMore("قطع السيارات", () {
                    Get.to(AllPeoductPage());
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  MostWantedWidget()
                ],
              ),
            ),
          ));
  }
}
