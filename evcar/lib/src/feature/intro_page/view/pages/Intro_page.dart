import 'package:evcar/src/feature/intro_page/view/main_widget/Intro_widget.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: IntroWidget(),
      ),
    );
  }
}
