import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/shop/model/shop_model.dart';
import 'package:evcar/src/feature/shop/view/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.shopModel});
  final ShopModel shopModel;
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
              width: context.screenWidth * 0.35,
              decoration: BoxDecoration(
                color: AppTheme.lightAppColors.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(shopModel.image),
                      SizedBox(
                        height: context.screenHeight * 0.005,
                      ),
                      MaintenanceText.shopMainText(shopModel.name),
                      SizedBox(
                        height: context.screenHeight * 0.01,
                      ),
                      MaintenanceText.shopSecText(shopModel.description),
                      SizedBox(
                        height: context.screenHeight * 0.02,
                      ),
                      Row(
                        children: [
                          MaintenanceText.addressText(shopModel.address),
                          const Spacer(),
                          Icon(
                            Icons.star,
                            color: Color(0xffF2C94C),
                          ),
                          MaintenanceText.orderMainText(shopModel.rate)
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
