import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppTheme.lightAppColors.buttoncolor, size: 150),
          ),
        ),
      ),
    );
  }
}
