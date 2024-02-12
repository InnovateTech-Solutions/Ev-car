import 'package:evcar/src/feature/maintenance/model/services_model.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/tags/view/page/vendor_tag_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesContainer extends StatelessWidget {
  const ServicesContainer(
      {super.key, required this.servicesModel, required this.onTap});

  final ServicesModel servicesModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(VendorTagsPage(
          id: servicesModel.id,
          title: servicesModel.title,
        ));
      },
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 35,
            backgroundColor: const Color.fromRGBO(215, 255, 255, 1),
            child: Image(
              image: NetworkImage(servicesModel.image),
            ),
          ),
          MaintenanceText.serviceText(shortenText(
            servicesModel.title,
          )),
        ],
      ),
    );
  }

  String shortenText(String text, {int maxLength = 12}) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }
}
