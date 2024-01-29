import 'package:evcar/src/future/car_show/controller/car_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonTitleCarShowWidget extends StatelessWidget {
  final List<String> text;
  final int index;
  final CarController controller;
  final Function()? onPressed;

  const CustomButtonTitleCarShowWidget({
    super.key,
    required this.text,
    required this.index,
    required this.controller,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Obx(
        () {
          final isPressed = controller.buttonCarsList[index];
          return Container(
            height: MediaQuery.of(context).size.height * .04,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(102, 102, 102, 1),
              ),
              borderRadius: BorderRadius.circular(10),
              color: isPressed ? Colors.black : null,
            ),
            child: MaterialButton(
              onPressed: () {
                controller.changeTitle(index); // Modify this line
              },
              child: Text(
                text[index],
                style: TextStyle(
                  color: isPressed
                      ? const Color.fromRGBO(255, 255, 255, 1)
                      : const Color.fromRGBO(102, 102, 102, 1),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
