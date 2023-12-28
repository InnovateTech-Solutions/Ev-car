import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/url_lancher_controller.dart';

class CustemButtonMessage extends StatelessWidget {
  CustemButtonMessage({super.key});
  final UrlLauncherController _whatsAppController =
      Get.put(UrlLauncherController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _whatsAppController.openWhatsAppChat('+962790973474');
      },
      child: const Image(
        image: AssetImage('assets/images/iconmessage.png'),
      ),
    );
  }
}
