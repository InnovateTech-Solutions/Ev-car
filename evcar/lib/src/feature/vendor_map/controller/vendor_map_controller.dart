// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:convert';

import 'package:evcar/src/core/constants/api_key.dart';
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
import 'package:http/http.dart' as http;

class AddLocation extends GetxController {
  static AddLocation get instance => Get.find();
  GoogleMapController? mapController;
  Completer<GoogleMapController> controller = Completer();

  final coordinate = TextEditingController();
  static CameraPosition intialCameraPositin = const CameraPosition(
    target: LatLng(37.422131, -122.084801),
  );
  Set<Marker> markers = {};
  Rx<BitmapDescriptor> markerIcon = BitmapDescriptor.defaultMarker.obs;
  late String mapStyleString;
  late LatLng initialPosition =
      const LatLng(31.900883058179527, 35.9346984671693);

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

  Future<void> putCoordinates(String number, String coordinates) async {
    try {
      print('coordinates ${number}');

      print('coordinates ${coordinates}');
      final response = await http.put(
        Uri.parse('${ApiKey.putCoordinates}962${number}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "coordinates": coordinates,
        }),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        print('Updated user details: $responseData');
        // Assuming you want to update UI with the new data, you can put your UI update logic here
      } else {
        throw Exception(
            'Failed to update user details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      // Show error message to the user using SnackBar
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

  //current location

  void goToPosition(Position position) async {
    final GoogleMapController mapController = await controller.future;
    print(position);
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15.151926040649414,
      ),
    ));
  }

  Future<void> getCurrentLocationButton() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Handle denied permission
    } else if (permission == LocationPermission.deniedForever) {
      // Handle permanently denied permission
    } else {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        initialPosition = LatLng(position.latitude, position.longitude);
        print(position);
        coordinate.text = position.toString();
        goToPosition(position);

        print("coordinates ${coordinate.text}");

        // Add marker to the current location
        markersList.clear();
        markersList.add(Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(title: 'Current Location'),
        ));
        // Set the coordinate text
        String coordinates = '${position.latitude},${position.longitude}';
        coordinate.text = coordinates;
        // ignore: empty_catches
      } catch (e) {}
    }
  }
}
