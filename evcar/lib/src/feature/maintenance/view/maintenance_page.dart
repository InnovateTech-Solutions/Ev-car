import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/maintenance/widget/main_widget/maintenance_widget.dart';
import 'package:flutter/material.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppTheme.lightAppColors.background,
      body: MaintenanceWidget(),
    ));
  }
}
