import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/forget_password/view/widget/main_widget/otp_forget_widget.dart';
import 'package:evcar/src/feature/login/view/widget/app_bar/login_appbar.dart';
import 'package:flutter/material.dart';

class ForgetOtpPage extends StatelessWidget {
  const ForgetOtpPage({required this.number, super.key});
  final String number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightAppColors.background,
      appBar: const AppBarLogin(),
      body: ForgetOtpWidget(number: number),
    );
  }
}
