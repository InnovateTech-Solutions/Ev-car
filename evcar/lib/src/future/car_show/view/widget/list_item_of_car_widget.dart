import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/car_controller.dart';
import 'item_car_widget.dart';

class ListItemOfCarWidget extends StatelessWidget {
  ListItemOfCarWidget({super.key});

  final CarController controller = Get.put(CarController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Obx(() => ListView.separated(
            itemBuilder: (context, index) => ItemCarWidget(
              image: controller.filteredCars[index].pic ?? '',
              name: controller.filteredCars[index].nameCar ?? '',
              text1: controller.filteredCars[index].feature?.join(', ') ?? '',
              price: controller.filteredCars[index].price ?? '',
              text2: controller.filteredCars[index].modelCar ?? '',
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            itemCount: controller.filteredCars.length,
          )),
    );
  }
}
