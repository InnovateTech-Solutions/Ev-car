import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/vendor_controller.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;

  final int index;
  final VendorController controller;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
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
              controller.changeColor(index);
            },
            child: Text(
              text,
              style: TextStyle(
                color: isPressed
                    ? const Color.fromRGBO(255, 255, 255, 1)
                    : const Color.fromRGBO(102, 102, 102, 1),
              ),
            ),
          ),
        );
      },
    );
  }
}
