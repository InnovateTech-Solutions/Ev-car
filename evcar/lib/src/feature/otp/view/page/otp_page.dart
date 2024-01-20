import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/login/view/widget/app_bar/login_appbar.dart';
import 'package:evcar/src/feature/otp/view/widget/main_widget/otp_widget.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({required this.userModel, super.key});

  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.lightAppColors.background,
        appBar: const AppBarLogin(),
        body: OtpWidget(
          userModel: userModel,
        ),
      ),
    );
  }
}
