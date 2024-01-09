import 'dart:async';
import 'dart:convert';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:evcar/src/feature/charging_station/controller/charging_station_controller.dart';
import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:evcar/src/feature/google_map/view/widget/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapController extends GetxController {
  Completer<GoogleMapController> controller = Completer();
  Rx<BitmapDescriptor> markerIcon = BitmapDescriptor.defaultMarker.obs;
  RxBool isExpanded = false.obs;
  final detailController = Get.put(ChargingStationController());
  late String mapStyleString;
  RxList<Marker> markers = <Marker>[].obs;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  late LatLng initialPosition =
      const LatLng(31.951953582563146, 35.87940404680269);

  Future<void> loadMarkers() async {
    final newMarkers = await getMarkers();
    markers.assignAll(newMarkers);
  }

  Future<Set<Marker>> getMarkers() async {
    final newMarkers = <Marker>{};
    const apiUrl =
        'https://adventurous-yak-pajamas.cyclic.app/stations/getStationsByType/charging_station';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> stationData = jsonDecode(response.body);
        for (var station in stationData) {
          final coordinates = station['coordinates'].split(',');
          final latitude = double.tryParse(coordinates[0]);
          final longitude = double.tryParse(coordinates[1]);
          if (latitude != null && longitude != null) {
            newMarkers.add(
              Marker(
                markerId: MarkerId(station['_id']),
                icon: markerIcon.value,
                position: LatLng(latitude, longitude),
                onTap: () {
                  customInfoWindowController.addInfoWindow!(
                    customWindow(
                      ChargingStationModel.fromJson(station),
                      () {
                        detailController.openGoogleMap(station['coordinates']);
                      },
                    ),
                    LatLng(latitude, longitude),
                  );
                },
              ),
            );
          } else {}
        }
      } else {
        throw Exception('Failed to load data');
      }
      // ignore: empty_catches
    } catch (e) {}
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
        initialPosition = LatLng(position.latitude, position.longitude);
        print(position);

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
    print(position);
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15.0,
      ),
    ));
  }
}
