import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/on_board/view/text_widget/on_boarding_text_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgets extends StatelessWidget {
  const OnBoardingWidgets({
    super.key,
    required this.title,
    required this.secText,
    required this.image,
  });
  final String title;
  final String secText;
  final Widget image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.06 * context.screenHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainText(title),
          SizedBox(
            width: context.screenWidth,
            height: context.screenWidth > 375
                ? 0.1 * context.screenHeight
                : 0.15 * context.screenHeight,
            child: thirdText(secText),
          ),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
          image
        ],
      ),
    );
  }
}
