import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/on_board/view/widget/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightAppColors.buttoncolor,
      body: const SafeArea(
        child: OnBoardingWidget(),
      ),
    );
  }
}
