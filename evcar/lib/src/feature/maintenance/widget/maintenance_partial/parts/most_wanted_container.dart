import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/product/view/product_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MostWantedContainer extends StatelessWidget {
  const MostWantedContainer({super.key, required this.partsModel});
  final PartsModel partsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductPage(
            productModel: PartsModel(
                title: partsModel.title,
                type: partsModel.type,
                phone: partsModel.phone,
                image: partsModel.image,
                price: partsModel.price,
                vendor: partsModel.vendor,
                vendorAddress: partsModel.vendorAddress)));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppTheme.lightAppColors.bordercolor,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.screenHeight * 0.01,
              horizontal: context.screenWidth * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaintenanceText.orderMainText(
                    partsModel.title,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Row(
                    children: [
                      const Image(
                          image: AssetImage('assets/images/Ellipse.png')),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .03,
                      ),
                      MaintenanceText.orderSecText(
                        partsModel.vendor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  MaintenanceText.orderPriceText(
                    partsModel.price,
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * .35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppTheme.lightAppColors.background,
                  // image: const DecorationImage(
                  //   alignment: Alignment.bottomCenter,
                  //   image: AssetImage(
                  //    partsModel.image,
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
