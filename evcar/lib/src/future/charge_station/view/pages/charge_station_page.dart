import 'package:evcar/src/future/charge_station/view/widget/charge_station_widget.dart';
import 'package:flutter/material.dart';

import '../widget/charge_station_appbar.dart';

class ChargeStationPage extends StatelessWidget {
  const ChargeStationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChargeStationAppBar(
        title: 'الشحن المتنقل',
      ),
      body: ChargeStationWidget(),
    );
  }
}
