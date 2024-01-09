import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:evcar/src/feature/portable_charger/controller/portable_charger_controller.dart';
import 'package:evcar/src/feature/portable_charger/view/widget/portable_charger_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortableChargerWidget extends StatelessWidget {
  const PortableChargerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PortableChargerController());

    return FutureBuilder(
      future: controller.fetchData(),
      builder: (context, AsyncSnapshot<List<ChargingStationModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: AppTheme.lightAppColors.bordercolor,
          ));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<ChargingStationModel> stations = snapshot.data!;
          return Container(
            margin:
                EdgeInsets.symmetric(horizontal: 0.012 * context.screenHeight),
            child: ListView.separated(
              itemCount: stations.length + 1,
              separatorBuilder: (BuildContext context, int index) {
                RxBool seeMore = false.obs;

                return PortableChargerCard(
                  model: stations[index],
                  seeMore: seeMore,
                  isFav: stations[index].isFav,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 0.04 * context.screenHeight,
                );
              },
            ),
          );
        }
      },
    );
  }
}
