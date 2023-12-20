import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> controller = Completer();
  Rx<BitmapDescriptor> markerIcon = BitmapDescriptor.defaultMarker.obs;
  RxBool isExpanded = false.obs;

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

  void addCustomMarker() {
    ImageConfiguration configuration =
        const ImageConfiguration(size: Size(100, 100));
    BitmapDescriptor.fromAssetImage(configuration, "asset/Pin.png")
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
