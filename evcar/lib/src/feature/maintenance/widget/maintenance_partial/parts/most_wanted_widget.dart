import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/maintenance/controller/maintenance_controller.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/parts/most_wanted_container.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MostWantedWidget extends StatelessWidget {
  const MostWantedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaintenanceController());
    return FutureBuilder(
        future: controller.FetchProductNumber(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Product> list = snapshot.data!;

              return SizedBox(
                height: context.screenHeight * 0.15 * list.length,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: context.screenHeight * 0.01,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: MostWantedContainer(partsModel: list[index]));
                  },
                ),
              );
            } else {
              return Center();
            }
          } else {
            return Center();
          }
        });
  }
}
