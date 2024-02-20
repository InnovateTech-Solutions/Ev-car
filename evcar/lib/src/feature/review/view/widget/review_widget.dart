import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/product/widget/text/product_text.dart';
import 'package:evcar/src/feature/review/controller/rating_controller.dart';
import 'package:evcar/src/feature/shop/widget/rating/shop_rating.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.shopModel});
  final Vendor shopModel;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RatinggController());

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          shopModel.rating != ""
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProductText.mainProductText(
                        ratingshortenText(shopModel.rating),
                        AppTheme.lightAppColors.subTextcolor),
                    Icon(
                      Icons.star,
                      color: Color(0xffF2C94C),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProductText.mainProductText(
                        "لا تقييم", AppTheme.lightAppColors.subTextcolor),
                    Icon(
                      Icons.star,
                      color: Color(0xffF2C94C),
                    ),
                  ],
                ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          SingleChildScrollView(
            child: FutureBuilder(
              future: controller.fetchReviews(shopModel.id),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final review = snapshot.data!;
                    return SizedBox(
                      width: context.screenWidth,
                      height: context.screenHeight * 0.7,
                      child: ListView.separated(
                        itemCount: review.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: context.screenHeight * .01,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            width: context.screenWidth,
                            height: context.screenHeight * 0.15,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppTheme.lightAppColors.bordercolor),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget.subVendorText(
                                        review[index].userId),
                                    TextWidget.vendorTextFiledLabel(
                                        shortenText(review[index].comment)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ProductText.mainProductText(
                                        review[index].rating.toString(),
                                        AppTheme.lightAppColors.subTextcolor),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffF2C94C),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: TextWidget.mainVendorText("لا يوجد تقييمات "),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.lightAppColors.bordercolor,
                    ),
                  );
                }
              },
            ),
          ),
          Spacer(),
          Obx(() {
            if (controller.isPostReviewed(shopModel.id)) {
              return IntroPageButton(
                  text: "اضافة تقييم",
                  onPressed: () {
                    Get.dialog(RatingDialog(
                      image: shopModel.img,
                      name: shopModel.title,
                      description: shopModel.description,
                      id: shopModel.id,
                    ));
                  },
                  colorText: AppTheme.lightAppColors.mainTextcolor,
                  colorButton: AppTheme.lightAppColors.buttoncolor);
            } else {
              return SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }

  String ratingshortenText(String text, {int maxLength = 3}) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}';
    }
  }

  String shortenText(String text, {int maxLength = 35}) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }
}
