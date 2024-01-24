import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorWidget extends StatelessWidget {
  final int count;
  final int currentPage;

  const IndicatorWidget({
    super.key,
    required this.count,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .05,
        vertical: MediaQuery.of(context).size.height * .01,
      ),
      child: SmoothPageIndicator(
        count: count,
        effect: const SlideEffect(
          offset: 1,
          dotColor: Color.fromRGBO(230, 230, 230, 0.4),
          dotWidth: 9,
          dotHeight: 9,
          activeDotColor: Color.fromRGBO(242, 242, 242, 1),
          spacing: 10,
        ),
        controller: PageController(initialPage: currentPage),
        onDotClicked: (index) {},
      ),
    );
  }
}
