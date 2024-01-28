import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/ads/controller/ads_constroller.dart';
import 'package:evcar/src/feature/ads/view/widget/text/ads_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AdsImage extends StatelessWidget {
  const AdsImage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdsController());

    return Container(
      padding: EdgeInsets.only(
          right: context.screenWidth * 0.03, top: context.screenHeight * 0.04),
      width: context.screenWidth,
      height: context.screenHeight * 0.25,
      decoration: BoxDecoration(
          color: AppTheme.lightAppColors.background,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdsText.mainText("أضف صورة"),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Container(
            width: context.screenWidth,
            height: context.screenHeight * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () => controller.pickImages(0),
                        child: Obx(
                          () => Container(
                            width: context.screenWidth * 0.37,
                            decoration: BoxDecoration(
                              color: AppTheme.lightAppColors.background,
                              border: Border.all(
                                color: AppTheme.lightAppColors.bordercolor,
                                width: context.screenWidth * 0.005,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              image: controller.adsImage.isNotEmpty
                                  ? DecorationImage(
                                      image: FileImage(
                                        controller.adsImage[0],
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: controller.adsImage.isEmpty
                                ? Center(
                                    child: SvgPicture.asset(
                                      "assets/images/image_icon.svg",
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.01,
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.47,
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              int imageIndex = index + 1;
                              return GestureDetector(
                                  onTap: () =>
                                      controller.pickImages(imageIndex),
                                  child: Obx(
                                    () => Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: context.screenWidth * 0.008,
                                        vertical: context.screenHeight * 0.002,
                                      ),
                                      decoration: BoxDecoration(
                                          color: AppTheme
                                              .lightAppColors.background,
                                          border: Border.all(
                                            color: AppTheme
                                                .lightAppColors.bordercolor,
                                            width: context.screenWidth * 0.005,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: controller.adsImage.length >
                                                  imageIndex
                                              ? DecorationImage(
                                                  image: FileImage(
                                                    controller
                                                        .adsImage[imageIndex],
                                                  ),
                                                  fit: BoxFit.cover)
                                              : DecorationImage(
                                                  image: AssetImage(""))),
                                    ),
                                  ));
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
