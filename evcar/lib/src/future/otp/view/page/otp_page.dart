import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/login/view/widget/login_appbar.dart';
import 'package:evcar/src/future/otp/view/widget/otp_widget.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.lightAppColors.background,
        appBar: const AppBarLogin(),
        body: const OtpWidget(),
      ),
    );
  }
}
