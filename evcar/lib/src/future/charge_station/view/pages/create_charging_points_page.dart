import 'package:evcar/src/future/charge_station/view/widget/create_charging_points_widget.dart';
import 'package:flutter/material.dart';
import '../widget/charge_station_appbar.dart';

class CreateChargingPointsPage extends StatelessWidget {
  const CreateChargingPointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChargeStationAppBar(
        title: 'تركيب نقاط شحن',
      ),
      body: CreateChargingPointsWidget(),
    );
  }
}
