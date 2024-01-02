import 'package:flutter/material.dart';

import '../widgets/appbar_maintenance.dart';
import '../widgets/maintenance_widget.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarMaintenance(),
      body: MaintenanceWidget(),
    );
  }
}
