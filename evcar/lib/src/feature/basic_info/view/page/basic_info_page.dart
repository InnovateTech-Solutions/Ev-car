import 'package:evcar/src/feature/basic_info/view/widget/basic_info_appbar.dart';
import 'package:evcar/src/feature/basic_info/view/widget/basic_info_widget.dart';
import 'package:flutter/material.dart';

class BasicInformationPage extends StatelessWidget {
  const BasicInformationPage({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: BasicInfoAppBar.appBar(),
          body: Center(
            child: BasicInformationWidget(
              token: token,
            ),
          )),
    );
  }
}
