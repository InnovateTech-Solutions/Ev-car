import 'package:evcar/src/feature/charging_station/controller/home_controller.dart';
import 'package:evcar/src/feature/google_map/view/pages/google_map_page.dart';
import 'package:evcar/src/feature/on_board/view/pages/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWidget extends GetView<HomeController> {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Obx(() => controller.isGoogleMapEnabled.value
        ? const GoogleMapPage()
        : const OnBoardPage());
  }
}
