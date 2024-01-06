import 'package:flutter/material.dart';

import '../../repository/charge_station_model/charge_model.dart';
import '../widget/charge_station_appbar.dart';
import '../widget/details_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.station});
  final ChargeModel station;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChargeStationAppBar(
        title: 'محطة الشحن',
      ),
      body: DetailsWidget(
        station: station,
      ),
    );
  }
}
