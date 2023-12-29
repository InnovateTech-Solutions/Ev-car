import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/charging_station/view/widget/detail_appbar.dart';
import 'package:evcar/src/future/portable_charger/view/widget/portable_charger_widget.dart';
import 'package:flutter/material.dart';

class PortableChargerPage extends StatelessWidget {
  const PortableChargerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar(
          "الشحن المتنقل",
        ),
        backgroundColor: AppTheme.lightAppColors.background,
        body: const PortableChargerWidget(),
      ),
    );
  }
}
