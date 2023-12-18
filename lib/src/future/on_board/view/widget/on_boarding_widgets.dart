import 'package:evcar/src/future/on_board/view/widget/on_boarding_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingWidgets extends StatelessWidget {
  const OnBoardingWidgets({
    super.key,
    required this.title,
    required this.secText,
    required this.image,
  });
  final String title;
  final String secText;
  final String image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: 0.15 * screenWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          mainText(title),
          thirdText(secText),
          SizedBox(
            height: 0.07 * screenWidth,
          ),
          SvgPicture.asset(image),
        ],
      ),
    );
  }
}
