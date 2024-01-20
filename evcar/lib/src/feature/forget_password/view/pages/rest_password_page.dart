import 'package:evcar/src/feature/forget_password/view/widget/app_bar/restPassword_appbar.dart';
import 'package:evcar/src/feature/forget_password/view/widget/main_widget/rest_password_widget.dart';
import 'package:flutter/material.dart';

class RestPasswordPage extends StatelessWidget {
  const RestPasswordPage({required this.phone, super.key});
  final String phone;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: RestPasswordAppbar(),
        body: RestPasswordWidget(phone: phone),
      ),
    );
  }
}
