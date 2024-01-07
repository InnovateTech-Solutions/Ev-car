import 'package:evcar/src/feature/login/view/widget/login_appbar.dart';
import 'package:evcar/src/feature/login/view/widget/login_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLogin(),
      body: LoginWidget(),
    );
  }
}
