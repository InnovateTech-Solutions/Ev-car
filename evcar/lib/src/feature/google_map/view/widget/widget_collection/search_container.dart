import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/google_map/controller/search_controller.dart';
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:evcar/src/feature/home_charging_station/controller/charging_station_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final searchController = Get.put(StationController());
final mapController = Get.put(ChargingStationController());

SizedBox searchContainer(
  BuildContext context,
) {
  return SizedBox(
    height: context.screenHeight * 0.678,
    child: Obx(
      () => ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: searchController.stations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              mapController
                  .openGoogleMap(searchController.stations[index].coordinates);
            },
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppTheme.lightAppColors.mainTextcolor,
                ),
                SizedBox(
                  width: context.screenWidth * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mapMainText(shortenText(
                      searchController.stations[index].title,
                    )),
                    searchsec(
                      searchController.stations[index].address,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: context.screenHeight * 0.02,
          );
        },
      ),
    ),
  );
}

String shortenText(String text, {int maxLength = 25}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}
