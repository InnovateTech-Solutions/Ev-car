// ignore_for_file: depend_on_referenced_packages

import 'package:evcar/src/feature/vendor_map/view/widgets/vendor_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class AddLocation extends GetxController {
  static AddLocation get instance => Get.find();
  GoogleMapController? mapController;
  final coordinate = TextEditingController();
  static CameraPosition intialCameraPositin = const CameraPosition(
    target: LatLng(37.422131, -122.084801),
  );
  Set<Marker> markers = {};
  Rx<BitmapDescriptor> markerIcon = BitmapDescriptor.defaultMarker.obs;
  late String mapStyleString;

  final markersList = <Marker>[].obs;
  late GoogleMapController googleMapController;
  final Mode mode = Mode.overlay;
  Rx address = "Loading...".obs;

//permission
  Future<Position> determinePosition() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnable) {
      return Future.error('Location services are disable');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }

  Future<String> displayPrediction(
      Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;
    final coordinates = '$lat,$lng';
    markersList.clear();
    markersList.add(Marker(
        markerId: const MarkerId("0"),
        icon: markerIcon.value,
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: detail.result.name)));

    googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));

    coordinate.text = coordinates.toString();

    getAddressFromCoordinates(lat, lng);

    print(coordinate.text);
    return coordinates;
  }

  Future<void> getAddressFromCoordinates(latitude, longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        address.value =
            "${placemark.street}, ${placemark.locality}, ${placemark.country}";
      }
      print(address.value);
    } catch (e) {
      print("Error: $e");
    }
  }

  //custom Marker
  // Future<void> addCustomMarker() async {
  //   ImageConfiguration configuration =
  //       const ImageConfiguration(size: Size(150, 150));
  //   await BitmapDescriptor.fromAssetImage(
  //           configuration, "assets/image/Location.png")
  //       .then((icon) {
  //     markerIcon.value = icon;
  //   });
  // }

  Future<void> loadMapStyle() async {
    mapStyleString = await rootBundle.loadString('assets/style/mapStyle.json');
  }

  //validation
  bool validateCoordinate(String coordinate) {
    List<String> parts = coordinate.split(',');
    if (parts.length != 2) {
      return false;
    }

    try {
      double latitude = double.parse(parts[0].trim());
      double longitude = double.parse(parts[1].trim());

      if (latitude >= -90.0 &&
          latitude <= 90.0 &&
          longitude >= -180.0 &&
          longitude <= 180.0) {
        return true;
      }
    } catch (e) {
      return false;
    }

    return false;
  }

  Future<void> handlePressButton(BuildContext context) async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        mode: mode,
        language: 'en',
        strictbounds: false,
        types: [
          ""
        ],
        components: [
          Component(Component.country, "Jo"),
        ]);

    displayPrediction(p!, homeScaffoldKey.currentState);
    print(homeScaffoldKey.currentState);
  }
}
