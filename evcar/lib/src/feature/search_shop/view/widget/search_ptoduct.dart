import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/product/model/product_detail_model.dart';
import 'package:evcar/src/feature/product/view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductWidget extends StatelessWidget {
  const SearchProductWidget({super.key, required this.partsModel});
  final ProductDetails partsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductPage(
          productId: partsModel.id,
        ));
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
                  MaintenanceText.orderMainText(shortenText(
                    partsModel.title,
                  )),
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
                      MaintenanceText.orderSecText(shortenText(
                        partsModel.description,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  MaintenanceText.orderPriceText(
                    partsModel.price + "دينار",
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * .35,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppTheme.lightAppColors.buttoncolor,
                        image: DecorationImage(
                          alignment: Alignment.bottomCenter,
                          image: NetworkImage(
                            partsModel.images.firstOrNull!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Image.network(
                        partsModel.images.firstOrNull!,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String shortenText(String text, {int maxLength = 15}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}
