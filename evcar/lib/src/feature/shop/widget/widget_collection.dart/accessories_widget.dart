import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/shop/widget/widget_collection.dart/accessories_container.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_all_product/controller/vendor_all_peoduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccessoriesWidget extends StatelessWidget {
  const AccessoriesWidget({Key? key, required this.id, required this.phone});
  final String id;
  final String phone;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorAllProductController());
    return Container(
      margin: EdgeInsets.all(5),
      child: FutureBuilder<Map<String, dynamic>>(
        future: controller.fetchData(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: AppTheme.lightAppColors.bordercolor,
            ));
          } else if (snapshot.hasError) {
            return Center(child: TextWidget.subVendorText('لا يوجد قطع'));
          } else {
            final data = snapshot.data!;
            return SizedBox(
              width: context.screenWidth * 0.9,
              height: context.screenHeight * 0.9,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data['classifiedProducts'].length,
                itemBuilder: (BuildContext context, int index) {
                  final category =
                      data['classifiedProducts'].keys.toList()[index];
                  final products = data['classifiedProducts'][category];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextWidget.subVendorText(
                          category,
                        ),
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.9,
                        height: context.screenHeight * 0.35,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = products[index];
                            return Center(
                              child: accessoriesContainer(
                                product: Product(
                                  id: product['_id'],
                                  title: product['title'],
                                  img: product['img'],
                                  price: product['price'],
                                  description: product['description'],
                                  typeOfProduct: " product['typeOfProduct']",
                                  vendor: " ",
                                ),
                                phone: phone,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: context.screenHeight * 0.05,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
