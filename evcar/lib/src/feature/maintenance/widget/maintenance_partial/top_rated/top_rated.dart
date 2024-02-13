import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/home_charging_station/view/widget/home_charging_card.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/shop/view/shop_page.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.shopModel});
  final Vendor shopModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ShopPage(
          shopModel: shopModel,
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: context.screenHeight * 0.01,
            horizontal: context.screenWidth * 0.01),
        width: context.screenWidth * 0.4,
        height: context.screenHeight * 0.25,
        decoration: BoxDecoration(
          color: AppTheme.lightAppColors.containercolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: context.screenHeight * 0.25,
              width: context.screenWidth * 0.35,
              decoration: BoxDecoration(
                color: AppTheme.lightAppColors.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: context.screenHeight * 0.12,
                        width: context.screenWidth * 0.35,
                        decoration: BoxDecoration(
                            color: AppTheme.lightAppColors.background,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(
                                  shopModel.img,
                                ),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.005,
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MaintenanceText.shopMainText(
                                  shortenText(shopModel.title)),
                              SizedBox(
                                height: context.screenHeight * 0.01,
                              ),
                              MaintenanceText.shopSecText(
                                  shortenText(shopModel.description)),
                              SizedBox(
                                height: context.screenHeight * 0.02,
                              ),
                              Row(
                                children: [
                                  MaintenanceText.addressText(
                                      addressshortenText(shopModel.address)),
                                  const Spacer(),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffF2C94C),
                                  ),
                                  MaintenanceText.orderMainText(
                                      ratingshortenText(shopModel.rating))
                                ],
                              )
                            ]),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String addressshortenText(String text, {int maxLength = 7}) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  String ratingshortenText(String text, {int maxLength = 3}) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}';
    }
  }
}
