import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherController extends GetxController {
  Future<void> openWhatsAppChat(String phoneNumber) async {
    final url = Uri.parse('https://api.whatsapp.com/send?phone=$phoneNumber');
    try {
      await launchUrl(url);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not launch WhatsApp',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> launchPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw 'Could not launch phone call';
    }
  }
}
