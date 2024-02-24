import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/vendor_account/view/page/otp_vendor_page.dart';
import 'package:evcar/src/feature/vendor_map/controller/vendor_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({required this.number, Key? key}) : super(key: key);
  final String number;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

const kGoogleApiKey = 'AIzaSyBJTNVgozL5JDsZvWNqGJBxc_jIWVEVx6w';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _MapWidgetState extends State<MapWidget> {
  final AddLocation mapController = Get.put(AddLocation());
  @override
  void initState() {
    initializeMap();

    super.initState();
  }

  void initializeMap() async {
    // await mapController.addCustomMarker();
    await mapController.loadMapStyle();
    await mapController.getCurrentLocationButton();
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
            initialCameraPosition: CameraPosition(
              target: mapController.initialPosition,
              zoom: 11.151926040649414,
            ),
            markers: mapController.markersList.toSet(),
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) async {
              await controller.setMapStyle(mapController.mapStyleString);
              mapController.googleMapController = controller;
              mapController.controller.complete(controller);
            },
          ),
        ),
        Positioned(
          top: context.screenHeight * 0.12,
          right: context.screenWidth * 0.05,
          child: GestureDetector(
            onTap: () async {
              await mapController.getCurrentLocationButton();
            },
            child: SvgPicture.asset(
              "assets/images/currentLocation.svg",
              width: 0.07 * context.screenWidth,
              height: 0.04 * context.screenHeight,
            ),
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
                      "انقر هنا للبحث عن الموقع",
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
              onPressed: () async {
                await mapController.putCoordinates(
                    widget.number, mapController.coordinate.text);

                await Get.offAll(OTPVendorPage(
                  number: widget.number,
                ));
              },
              colorText: AppTheme.lightAppColors.mainTextcolor,
            ))
      ],
    );
  }
}
