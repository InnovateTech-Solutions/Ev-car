import 'package:flutter/material.dart';
import '../../../charge_station/view/widget/charge_station_appbar.dart';

class ComputerCheckPage extends StatelessWidget {
  const ComputerCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChargeStationAppBar(
        title: 'فحص كمبيوتر',
      ),
    );
  }
}
