import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherController extends GetxController {


  void openWhatsAppChat(String phoneNumber) async {
    final url = 'https://wa.me/$phoneNumber';
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      Get.snackbar(
        'Error',
        'Could not launch WhatsApp',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
