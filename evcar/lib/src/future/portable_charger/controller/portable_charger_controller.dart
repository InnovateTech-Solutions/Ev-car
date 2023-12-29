import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PortableChargerController extends GetxController {
  final RxBool seeMore = false.obs;

  void openWhatsAppChat(String phoneNumber) async {
    final url = Uri.parse('https://wa.me/$phoneNumber');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchPhoneCall(String phoneNumber) async {
    final url = Uri.parse('tel:$phoneNumber');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
