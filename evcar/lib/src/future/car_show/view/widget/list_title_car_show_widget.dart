import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/car_controller.dart';
import 'custom_button_title_car_show_widget.dart';

class ListTitleCarShowWidget extends StatelessWidget {
  ListTitleCarShowWidget({super.key});
  final CarController controller = Get.put(CarController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .04,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CustomButtonTitleCarShowWidget(
          text: const ['all', 'bmw', 'ford', 'mercedes-benz'],
          controller: controller,
          index: index,
          onPressed: () {
            controller.changeTitle(index);
          },
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * .03,
        ),
        itemCount: 4,
      ),
    );
  }
}
