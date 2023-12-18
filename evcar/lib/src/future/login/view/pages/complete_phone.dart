import 'package:evcar/src/future/login/view/widget/complete_phone_widget.dart';
import 'package:evcar/src/future/login/view/widget/login_appbar.dart';
import 'package:flutter/material.dart';

class CompletePhone extends StatelessWidget {
  const CompletePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarLogin(),
      body: CompletePhoneWidget(),
    );
  }
}
