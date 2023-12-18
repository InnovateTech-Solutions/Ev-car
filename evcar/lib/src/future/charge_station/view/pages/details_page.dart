import 'package:flutter/material.dart';

import '../widget/charge_station_appbar.dart';
import '../widget/details_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChargeStationAppBar(
        title: 'محطة الشحن',
      ),
      body: DetailsWidget(),
    );
  }
}
