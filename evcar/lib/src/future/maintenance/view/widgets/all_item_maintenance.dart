import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/battery_check_page.dart';
import '../pages/computer_check_page.dart';
import '../pages/external_maintenance_page.dart';
import '../pages/periodic_maintenance_page.dart';
import 'item_widget_maintenance.dart';

class AllItemMaintenance extends StatelessWidget {
  const AllItemMaintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemWidgetMaintenance(
          onTap: () {
            Get.to(
              const PeriodicMaintenancePage(),
            );
          },
          image: 'assets/images/wrench.png',
          text: 'صيانة دورية',
        ),
        ItemWidgetMaintenance(
          onTap: () {
            Get.to(
              const BatteryCheckPage(),
            );
          },
          image: 'assets/images/basil_battry-half-outline.png',
          text: 'فحص البطارية',
        ),
        ItemWidgetMaintenance(
          onTap: () {
            Get.to(
              const ComputerCheckPage(),
            );
          },
          image: 'assets/images/ic_round-computer.png',
          text: 'فحص كمبيوتر',
        ),
        ItemWidgetMaintenance(
          onTap: () {
            Get.to(const ExternalMaintenancePage());
          },
          image: 'assets/images/clarity_car-line.png',
          text: 'صيانة خارجية',
        ),
      ],
    );
  }
}
