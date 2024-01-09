import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/google_map/controller/google_map_controller.dart';
import 'package:evcar/src/feature/google_map/view/widget/google_map_container.dart';
import 'package:evcar/src/feature/google_map/view/widget/google_map_text.dart';
import 'package:evcar/src/feature/profile/view/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final mapController = Get.put(MapController());
  @override
  void initState() {
    super.initState();
    initializeMap();
  }

  void initializeMap() async {
    await mapController.loadMapStyle();

    await mapController.addCustomMarker();
    await mapController.getCurrentLocation();

    await mapController.loadMarkers();
  }

  @override
  void dispose() {
    mapController.controller = Completer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Obx(
            () => GoogleMap(
              zoomControlsEnabled: false,
              onTap: (position) {
                mapController.customInfoWindowController.hideInfoWindow!();
              },
              onCameraMove: (position) {
                mapController.customInfoWindowController.onCameraMove!();
              },
              markers: mapController.markers.toSet(),
              initialCameraPosition: CameraPosition(
                target: mapController.initialPosition,
                zoom: 15.151926040649414,
              ),
              onMapCreated: (GoogleMapController controller) async {
                controller.setMapStyle(mapController.mapStyleString);
                mapController.controller.complete(controller);
                await mapController.loadMarkers();
                mapController.customInfoWindowController.googleMapController =
                    controller;
              },
            ),
          ),
          CustomInfoWindow(
            controller: mapController.customInfoWindowController,
            height: 0.14 * context.screenHeight,
            width: 0.6 * context.screenWidth,
            offset: 50,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: 1 * context.screenWidth,
                height: 0.13 * context.screenHeight,
                decoration: BoxDecoration(
                  color: AppTheme.lightAppColors.primary,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(const ProfilePage());
                      },
                      icon: const Icon(Icons.person_2_outlined),
                      color: AppTheme.lightAppColors.background,
                    ),
                    SizedBox(
                      width: 0.2 * context.screenWidth,
                    ),
                    mapMainText("محطات الشحن"),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 0.75 * context.screenWidth,
              height: 0.35 * context.screenHeight,
              decoration: BoxDecoration(
                  color: AppTheme.lightAppColors.buttoncolor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20))),
            ),
          ),
          const GoogleMapContainer()
        ],
      ),
    );
  }
}
