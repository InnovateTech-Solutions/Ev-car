import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_appbar.dart';
import 'package:evcar/src/feature/maintenance_shop/view/widget/maintenance_shop_widget.dart';
import 'package:flutter/material.dart';

class MaintenanceShopPage extends StatelessWidget {
  const MaintenanceShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar("مراكز الصيانه"),
        backgroundColor: AppTheme.lightAppColors.background,
        body: MaintenanceShopWidget(),
      ),
    );
  }
}
