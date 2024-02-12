import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_all_product/controller/vendor_all_peoduct_controller.dart';
import 'package:evcar/src/feature/vendor_all_product/view/widget/widget_collection/vendor_product_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorAllProductWidget extends StatelessWidget {
  const VendorAllProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorAllProductController());
    return Container(
      margin: EdgeInsets.all(10),
      child: FutureBuilder<Map<String, dynamic>>(
        future: controller.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = products[index];
                        return VendorProductContainer(
                          partsModel: VendorProduct(
                            id: product['_id'],
                            title: product['title'],
                            img: product['img'],
                            price: product['price'],
                            description: product['description'],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
