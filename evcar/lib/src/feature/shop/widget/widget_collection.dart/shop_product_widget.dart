import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/shop/controller/shop_controller.dart';
import 'package:evcar/src/feature/shop/widget/widget_collection.dart/accessories_container.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopProductWidget extends StatelessWidget {
  const ShopProductWidget({
    Key? key,
    required this.vendorId,
    required this.phone,
  }) : super(key: key);

  final String vendorId;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShopController());
    return FutureBuilder<void>(
      future: controller.fetchProductsByVendorId(vendorId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppTheme.lightAppColors.bordercolor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
              child: TextWidget.subVendorText("لا يوجد قطع غيار السيارات"));
        } else {
          return Obx(
            () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.carServices.length != 0
                      ? SizedBox(
                          height: context.screenHeight * 0.33,
                          width: context.screenWidth,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.carServices.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final product = controller.carServices[index];
                              return Center(
                                child: accessoriesContainer(
                                  product: Product(
                                    id: product.id,
                                    title: product.title,
                                    img: product.img,
                                    price: product.price,
                                    description: product.description,
                                    typeOfProduct: product.typeOfProduct,
                                    vendor: product.vendor,
                                  ),
                                  phone: phone,
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: TextWidget.subVendorText(
                              "لا يوجد قطع غيار السيارات"),
                        )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
