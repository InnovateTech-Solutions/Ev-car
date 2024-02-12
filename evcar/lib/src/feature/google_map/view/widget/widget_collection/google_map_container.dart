import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/google_map/controller/search_controller.dart';
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:evcar/src/feature/google_map/view/widget/widget_collection/google_map_button.dart';
import 'package:evcar/src/feature/google_map/view/widget/widget_collection/google_map_search.dart';
import 'package:evcar/src/feature/google_map/view/widget/widget_collection/search_container.dart';
import 'package:evcar/src/feature/home_charging_station/view/page/home_charging_page.dart';
import 'package:evcar/src/feature/mobile_charger/view/page/mobile_charger_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/google_map_controller.dart';

class GoogleMapContainer extends StatefulWidget {
  const GoogleMapContainer({super.key});

  @override
  State<GoogleMapContainer> createState() => _GoogleMapContainerState();
}

class _GoogleMapContainerState extends State<GoogleMapContainer> {
  final mapController = Get.put(MapController());
  final searchController = Get.put(StationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: mapController.isExpanded.value == true
                ? context.width
                : 0.9 * context.screenWidth,
            height: mapController.isExpanded.value == true
                ? context.screenHeight
                : 0.32 * context.height,
            padding: const EdgeInsets.all(
              10,
            ),
            decoration: BoxDecoration(
                color: AppTheme.lightAppColors.primary,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  children: [
                    mapController.isExpanded.value == true
                        ? IconButton(
                            icon: const Icon(Icons.close),
                            color: AppTheme.lightAppColors.background,
                            onPressed: () {
                              mapController.isExpanded.value = false;
                              searchController.stations.clear();

                              searchController.searchText.clear();
                            },
                          )
                        : Container(),
                    SvgPicture.asset(
                      "assets/images/chargeIcon.svg",
                      width: 0.07 * context.screenWidth,
                    ),
                    SizedBox(
                      width: 0.02 * context.screenWidth,
                    ),
                    mapSecText("قاعدة \nشحن سريع"),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        mapController.getCurrentLocation();
                        mapController.isExpanded.value = false;
                      },
                      child: SvgPicture.asset(
                        "assets/images/currentLocation.svg",
                        width: 0.07 * context.screenWidth,
                        height: 0.04 * context.screenHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.02 * context.screenHeight,
                ),
                SearchForm(
                  search: SearchFormEntitiy(
                    searchController: searchController.searchText,
                    hintText: "أدخل اسم المحطة",
                    type: TextInputType.text,
                    onChange: (value) {
                      if (value!.isEmpty) {
                        searchController.stations.clear();
                      } else {
                        searchController.searchStations(value);
                      }
                    },
                  ),
                ),
                mapController.isExpanded.value == true
                    ? searchContainer(
                        context,
                      )
                    : const Spacer(),
                mapController.isExpanded.value == false
                    ? Divider(
                        thickness: 2,
                        height: 0.05 * context.screenHeight,
                      )
                    : Container(),
                mapController.isExpanded.value == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonWidget(
                              onTap: () {
                                Get.to(const MobileChargerPage());
                                mapController.getMarkers();
                              },
                              title: "الشحن المتنقل",
                              color: AppTheme.lightAppColors.buttoncolor),
                          SizedBox(
                            width: 0.05 * context.screenWidth,
                          ),
                          ButtonWidget(
                              onTap: () {
                                Get.to(const ChargingStationPage());
                              },
                              title: "تركيب نقطة شحن",
                              color: AppTheme.lightAppColors.primary),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
