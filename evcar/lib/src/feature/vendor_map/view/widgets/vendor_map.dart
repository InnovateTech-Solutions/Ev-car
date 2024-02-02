import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/vendor_map/controller/vendor_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

const kGoogleApiKey = 'AIzaSyBWEtkLBMq5z_dYE1jnuATj6cgW2nyoGCw';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _MapWidgetState extends State<MapWidget> {
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(37.42796, -122.08574), zoom: 14.0);
  final AddLocation mapController = Get.put(AddLocation());
  @override
  void initState() {
    initializeMap();

    super.initState();
  }

  void initializeMap() async {
    // await mapController.addCustomMarker();
    await mapController.loadMapStyle();
    // await mapController.handlePressButton(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: homeScaffoldKey,
      children: [
        Obx(
          () => GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: initialCameraPosition,
            markers: mapController.markersList.toSet(),
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) async {
              await controller.setMapStyle(mapController.mapStyleString);
              mapController.googleMapController = controller;
            },
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
              onTap: () {
                mapController.handlePressButton(context);
              },
              child: Container(
                  width: context.screenWidth,
                  height: context.screenHeight * 0.1,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppTheme.lightAppColors.primary),
                      color: AppTheme.lightAppColors.primary,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      )),
                  child: Center(
                    child: Text(
                      "Click to choose an Address",
                      style: TextStyle(
                          fontFamily: 'cairo-Regular',
                          color: AppTheme.lightAppColors.mainTextcolor,
                          fontSize: 20),
                    ),
                  ))),
        ),
        Positioned(
            bottom: context.screenHeight * 0.02,
            left: context.screenWidth * 0.05,
            right: context.screenWidth * 0.05,
            child: IntroPageButton(
              colorButton: AppTheme.lightAppColors.buttoncolor,
              text: 'Next',
              onPressed: () {},
              colorText: AppTheme.lightAppColors.mainTextcolor,
            ))
      ],
    );
  }
}
