import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_appbar.dart';
import 'package:evcar/src/feature/mobile_charger/view/widget/main_page/mobile_charging_widget.dart';
import 'package:flutter/material.dart';

class MobileChargerPage extends StatelessWidget {
  const MobileChargerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar(
          "الشحن المتنقل",
        ),
        backgroundColor: AppTheme.lightAppColors.background,
        body: const MobileCharchingStations(),
      ),
    );
  }
}
