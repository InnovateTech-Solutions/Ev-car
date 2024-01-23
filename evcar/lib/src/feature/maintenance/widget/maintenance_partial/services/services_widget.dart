import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/maintenance/model/services_model.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/services/services_container.dart';
import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    List<ServicesModel> list = [
      ServicesModel(
          image: "assets/images/ic_round-computer.png", title: "title"),
      ServicesModel(
          image: "assets/images/ic_round-computer.png", title: "title"),
      ServicesModel(
          image: "assets/images/ic_round-computer.png", title: "title"),
      ServicesModel(
          image: "assets/images/ic_round-computer.png", title: "title"),
    ];
    return SizedBox(
      height: context.screenHeight * 0.15,
      width: context.screenHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ServicesContainer(servicesModel: list[index], onTap: () {});
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: context.screenWidth * 0.05,
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
