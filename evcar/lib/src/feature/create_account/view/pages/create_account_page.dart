import 'package:evcar/src/feature/create_account/view/widget/main_widget/create_account_widget.dart';
import 'package:evcar/src/feature/login/view/widget/app_bar/login_appbar.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLogin(),
      body: CreateAccountWidget(),
    );
  }
}
