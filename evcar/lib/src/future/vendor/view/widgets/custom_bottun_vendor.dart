import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/vendor_controller.dart';

class CustomButtonVendor extends StatelessWidget {
  final String text;
  final String? image;
  final int index;
  final VendorController controller;

  const CustomButtonVendor({
    super.key,
    required this.text,
    this.image,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final isPressed = controller.buttonPressedList[index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(102, 102, 102, 1),
            ),
            borderRadius: BorderRadius.circular(10),
            color: isPressed ? Colors.black : null,
          ),
          child: MaterialButton(
            onPressed: () {
              controller.changeButtonColor(index);
            },
            child: Column(
              children: [
                Image(
                  image: AssetImage(image ?? ''),
                  color: isPressed
                      ? const Color.fromRGBO(255, 255, 255, 1)
                      : const Color.fromRGBO(102, 102, 102, 1),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: isPressed
                        ? const Color.fromRGBO(255, 255, 255, 1)
                        : const Color.fromRGBO(102, 102, 102, 1),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
