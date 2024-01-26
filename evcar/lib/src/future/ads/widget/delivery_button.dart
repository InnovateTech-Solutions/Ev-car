import 'package:flutter/material.dart';
import '../../../core/widget/text_widget/text_widget.dart';
import 'package:get/get.dart';
import '../controller/ads_controller.dart';

class DeliveryButton extends StatelessWidget {
  const DeliveryButton({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .06,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .03,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(218, 218, 218, 1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Obx(
              () => Icon(
                Icons.circle_outlined,
                color: Get.find<AdsController>().buttonColor.value,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * .02),
            Styles.textstyle17normal(text, Colors.black),
          ],
        ),
      ),
    );
  }
}
