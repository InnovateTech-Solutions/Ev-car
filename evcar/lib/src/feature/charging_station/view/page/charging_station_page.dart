import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/view/widget/charging_station_widget.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_appbar.dart';
import 'package:flutter/material.dart';

class ChargingStationPage extends StatelessWidget {
  const ChargingStationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar("تركيب نقاط شحن"),
        backgroundColor: AppTheme.lightAppColors.background,
        body: const ChargingStationWidget(),
      ),
    );
  }
}
