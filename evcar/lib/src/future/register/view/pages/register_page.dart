import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/register/view/widget/register_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.lightAppColors.background,
        body: const RegisterWidgets(),
      ),
    );
  }
}
