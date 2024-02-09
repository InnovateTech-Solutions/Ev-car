import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/maintenance_shop/controller/maintenance_shop_controller.dart';
import 'package:evcar/src/feature/maintenance_shop/view/widget/maintenance_shop_card.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaintenanceShopWidget extends StatelessWidget {
  const MaintenanceShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaintenanceShopController());
    return FutureBuilder(
      future: controller.getAllVendor(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            List<Vendor> vendor = snapshot.data!;

            return Container(
              margin: EdgeInsets.only(
                  left: context.screenWidth * 0.01,
                  right: context.screenWidth * 0.01,
                  top: context.screenHeight * 0.01),
              child: SizedBox(
                width: context.screenWidth,
                height: context.screenHeight,
                child: ListView.separated(
                  itemCount: vendor.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: context.screenHeight * 0.01,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return MaintenanceShopCard(
                      model: vendor[index],
                    );
                  },
                ),
              ),
            );
          } else {
            return Center();
          }
        } else {
          return Center();
        }
      },
    );
  }
}
