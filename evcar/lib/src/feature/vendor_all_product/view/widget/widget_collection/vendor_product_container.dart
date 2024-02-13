import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/parts/most_wanted_container.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/vendor_all_product/view/widget/widget_collection/delete_dialog.dart';
import 'package:evcar/src/feature/vendor_all_product/view/widget/widget_collection/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorProductContainer extends StatelessWidget {
  const VendorProductContainer({super.key, required this.partsModel});
  final VendorProduct partsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Get.dialog(DeleteDialog(
                      id: partsModel.id,
                    ));
                  },
                  icon: Icon(Icons.delete),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Get.dialog(EditProduct(
                      product: Product(
                          id: partsModel.id,
                          title: partsModel.title,
                          img: partsModel.img,
                          price: partsModel.price,
                          description: partsModel.description,
                          typeOfProduct: '',
                          vendor: ''),
                    ));
                  },
                  icon: Icon(Icons.edit),
                )),
            Row(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
