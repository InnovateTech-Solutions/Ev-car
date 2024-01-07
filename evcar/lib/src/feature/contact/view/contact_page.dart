import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_appbar.dart';
import 'package:evcar/src/feature/contact/widget/contact_widget.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar("اتصل بنا"),
        backgroundColor: AppTheme.lightAppColors.background,
        body: const ContactWidget(),
      ),
    );
  }
}
