import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/maintenance/controller/maintenance_controller.dart';
import 'package:evcar/src/feature/maintenance/model/services_model.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/services/services_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaintenanceController());

    return FutureBuilder(
        future: controller.fetchTags(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<ServicesModel> tags = snapshot.data!;
              return SizedBox(
                height: context.screenHeight * 0.15,
                width: context.screenHeight,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ServicesContainer(
                        servicesModel: tags[index], onTap: () {});
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: context.screenWidth * 0.05,
                    );
                  },
                  itemCount: tags.length,
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
