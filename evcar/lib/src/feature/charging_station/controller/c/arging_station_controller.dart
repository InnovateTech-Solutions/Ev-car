import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ChargingStationController extends GetxController {
  void openGoogleMap(coordinates) async {
    final coordinate = coordinates;
    final latLng = coordinate.split(',');
    final latitude = double.tryParse(latLng[0].trim()) ?? 0.0;
    final longitude = double.tryParse(latLng[1].trim()) ?? 0.0;
    Uri mapUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (!await launchUrl(mapUrl)) {
      throw Exception('Could not launch $mapUrl');
    }
  }
}
