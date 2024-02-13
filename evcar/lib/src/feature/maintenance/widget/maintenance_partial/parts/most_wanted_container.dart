import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:flutter/material.dart';

import '../../../../product/view/product_page.dart';

class MostWantedContainer extends StatelessWidget {
  const MostWantedContainer({super.key, required this.partsModel});
  final Product partsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductPage(
                    productId: partsModel.id,
                  )),
        );
      },
      child: Container(
        height: context.screenHeight * .14,
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
                    partsModel.price + "  دينار ",
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
                        color: AppTheme.lightAppColors.background,
                        image: DecorationImage(
                          image: NetworkImage(
                            partsModel.img.firstOrNull!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Image.network(
                        partsModel.img.firstOrNull!,
                        fit: BoxFit.cover,
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

String shortenText(String text, {int maxLength = 25}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}
