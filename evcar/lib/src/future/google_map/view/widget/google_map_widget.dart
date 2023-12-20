import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/google_map/controller/google_map_controller.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_container.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late String _mapStyleString;
  final mapController = Get.put(MapController());

  @override
  void initState() {
    rootBundle.loadString('assets/mapStyle.json').then((string) {
      _mapStyleString = string;
    });
    super.initState();
    mapController.getCurrentLocation();
    mapController.addCustomMarker();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            markers: {
              Marker(
                markerId: const MarkerId('Sydney'),
                position: const LatLng(37.4219991, -122.0840011),
                icon: mapController.markerIcon.value,
              )
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.43296265331129, -122.08832357078792),
              zoom: 15.151926040649414,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController.controller.complete(controller);
              mapController.controller.future.then((value) {
                value.setMapStyle(_mapStyleString);
              });
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: 1 * screenWidth,
                height: 0.2 * screenWidth,
                decoration: BoxDecoration(
                  color: AppTheme.lightAppColors.primary,
                ),
                child: Center(
                  child: mapMainText("محطات الشحن"),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 0.75 * screenWidth,
              height: 0.65 * screenWidth,
              decoration: BoxDecoration(
                  color: AppTheme.lightAppColors.buttoncolor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20))),
            ),
          ),
          googleMapContainer(screenWidth, context)
        ],
      ),
    );
  }
}
