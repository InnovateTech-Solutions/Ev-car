import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/maintenance/controller/maintenance_controller.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/top_rated/top_rated.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaintenanceController());
    return FutureBuilder(
        future: controller.fetchVendors(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Vendor> vendor = snapshot.data!;
              return SizedBox(
                height: context.screenHeight * 0.28,
                width: context.screenWidth,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return TopRated(shopModel: vendor[index]);
                    }),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: context.screenWidth * 0.03,
                      );
                    },
                    itemCount: 5),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: AppTheme.lightAppColors.bordercolor,
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.lightAppColors.bordercolor,
              ),
            );
          }
        });
  }
}
