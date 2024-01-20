import 'package:evcar/src/feature/forget_password/view/widget/app_bar/forget_password_appbar.dart';
import 'package:evcar/src/feature/forget_password/view/widget/main_widget/forget_password_widget.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ForgetPasswordAppBar(),
      body: ForgetPasswordWidget(),
    ));
  }
}
