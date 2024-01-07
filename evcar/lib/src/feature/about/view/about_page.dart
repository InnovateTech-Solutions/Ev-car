import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_appbar.dart';
import 'package:flutter/material.dart';

import '../widget/about_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar("عن التطبيق"),
        backgroundColor: AppTheme.lightAppColors.background,
        body: const AboutWidget(),
      ),
    );
  }
}
