import 'package:flutter/material.dart';

import '../../../charge_station/repository/charge_station_model/charge_model.dart';
import '../widgets/appbar_maintenance.dart';
import '../widgets/maintenance_widget.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key, required this.station});
  final ChargeModel station;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMaintenance(),
      body: MaintenanceWidget(
        station: station,
      ),
    );
  }
}
