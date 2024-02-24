import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/product/widget/text/product_text.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_phone_button.dart';
import 'package:evcar/src/feature/review/view/page/review_page.dart';
import 'package:evcar/src/feature/shop/widget/rating/shop_type_widget.dart';
import 'package:evcar/src/feature/shop/widget/widget_collection.dart/accessories_widget.dart';
import 'package:evcar/src/feature/shop/widget/widget_collection.dart/shop_app_bar.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({super.key, required this.shopModel});
  final Vendor shopModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.screenHeight * 0.02,
        horizontal: context.screenWidth * 0.05,
      ),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ShopAppBar(),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: context.screenWidth,
            height: 0.25 * context.screenHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(shopModel.img), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.lightAppColors.background,
                  child: GestureDetector(
                    onTap: () => {},
                    child: SvgPicture.asset(
                      'assets/images/favTrueHeart.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          Row(
            children: [
              ProductText.mainProductText(shopModel.title, Colors.black),
              const Spacer(),
              shopModel.rating != ""
                  ? GestureDetector(
                      onTap: () {
                        Get.to(ReviewPage(
                          shopModel: shopModel,
                        ));
                      },
                      child: Row(
                        children: [
                          ProductText.mainProductText(
                              ratingshortenText(shopModel.rating),
                              AppTheme.lightAppColors.subTextcolor),
                          Icon(
                            Icons.star,
                            color: Color(0xffF2C94C),
                          ),
                        ],
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.to(ReviewPage(
                          shopModel: shopModel,
                        ));
                      },
                      child: Row(
                        children: [
                          ProductText.mainProductText(
                              "لا تقييم", AppTheme.lightAppColors.subTextcolor),
                          Icon(
                            Icons.star,
                            color: Color(0xffF2C94C),
                          ),
                        ],
                      ),
                    )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          ProductText.secProductText(shopModel.description),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.01,
          ),
          ShopTypeWidget(
            title: shopModel.type,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.04,
          ),
          ProductText.productAddressText(shopModel.address),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.04,
          ),
          ProductPhoneButton(
            phone: shopModel.number,
            id: shopModel.id,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          ProductText.productDescriptionText(shopModel.subtitle),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          //  ProductText.headerText("إكسسوارات السيارات"),
          AccessoriesWidget(
            id: shopModel.id,
            phone: shopModel.number,
          )
        ]),
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
}
