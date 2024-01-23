import 'package:evcar/src/feature/maintenance/model/services_model.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:flutter/material.dart';

class ServicesContainer extends StatelessWidget {
  const ServicesContainer(
      {super.key, required this.servicesModel, required this.onTap});

  final ServicesModel servicesModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 35,
            backgroundColor: const Color.fromRGBO(215, 255, 255, 1),
            child: Image(
              image: AssetImage(servicesModel.image),
            ),
          ),
          MaintenanceText.serviceText(
            servicesModel.title,
          ),
        ],
      ),
    );
  }
}
