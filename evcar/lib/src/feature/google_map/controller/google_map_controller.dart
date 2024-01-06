import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:evcar/src/feature/charging_station/controller/c/arging_station_controller.dart';
import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:evcar/src/feature/google_map/view/widget/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> controller = Completer();
  Rx<BitmapDescriptor> markerIcon = BitmapDescriptor.defaultMarker.obs;
  RxBool isExpanded = false.obs;
  final detailController = Get.put(ChargingStationController());
  late String mapStyleString;

  RxList<Marker> markers = <Marker>[].obs;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  @override
  void onInit() {
    super.onInit();
    addCustomMarker();

    loadMarkers();
    getCurrentLocation();
  }

  Future<void> loadMarkers() async {
    final newMarkers = await getMarkers();
    markers.assignAll(newMarkers);
  }

  Future<Set<Marker>> getMarkers() async {
    final newMarkers = <Marker>{};

    newMarkers.add(
      Marker(
        markerId: const MarkerId('Sydney'),
        icon: markerIcon.value,
        position: const LatLng(37.4219991, -122.0840011),
        onTap: () {
          customInfoWindowController.addInfoWindow!(
            customWindow(
              ChargingStationModel(
                  charger: [
                    "شاحن صيني",
                    "شاحن تسلا",
                    "شاحن تسلا",
                  ],
                  description:
                      "تتوفر لدينا خدمات اضافية مثل غسيل السيارات وكافيه للجلوس والانتظار لحين انتهاء الشحن",
                  image: "assets/images/station.png",
                  location: "عمان - القويسمة",
                  name: "توب لنقاط الشحن",
                  phone: "07788994456",
                  rate: " 4.6",
                  coordinate: '37.4219991,-122.0840011',
                  feature: []),
              () {
                detailController.openGoogleMap('37.4219991,-122.0840011');
              },
            ),
            const LatLng(37.4219991, -122.0840011),
          );
        },
      ),
    );
    return newMarkers;
  }

  Future<void> loadMapStyle() async {
    mapStyleString = await rootBundle.loadString('assets/style/mapStyle.json');
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
    } else if (permission == LocationPermission.deniedForever) {
    } else {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        goToPosition(position);
        // ignore: empty_catches
      } catch (e) {}
    }
  }

  Future<void> addCustomMarker() async {
    ImageConfiguration configuration =
        const ImageConfiguration(size: Size(100, 100));
    await BitmapDescriptor.fromAssetImage(
            configuration, "assets/images/Pin.png")
        .then((icon) {
      markerIcon.value = icon;
    });
  }

  void goToPosition(Position position) async {
    final GoogleMapController mapController = await controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15.0,
      ),
    ));
  }
}
