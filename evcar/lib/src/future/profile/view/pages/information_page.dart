import 'package:flutter/material.dart';

import '../../../charge_station/view/widget/charge_station_appbar.dart';
import '../widget/information_widget.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChargeStationAppBar(
        title: 'المعلومات الشخصية',
      ),
      body: InformationWidget(),
    );
  }
}
