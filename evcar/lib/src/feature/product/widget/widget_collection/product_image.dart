import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    var currentPage = 0.obs;

    return Column(
      children: [
        Container(
          height: context.screenHeight * 0.2,
          width: context.screenWidth * 0.7,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              currentPage.value = index;
            },
            itemBuilder: (context, index) {
              return Image.network(
                images[index],
                fit: BoxFit.contain,
              );
            },
          ),
        ),
        SizedBox(height: context.screenHeight * 0.01),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => Container(
                height: context.screenWidth * 0.02,
                width: context.screenWidth * 0.02,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage.value == index
                      ? AppTheme.lightAppColors.buttoncolor
                      : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
