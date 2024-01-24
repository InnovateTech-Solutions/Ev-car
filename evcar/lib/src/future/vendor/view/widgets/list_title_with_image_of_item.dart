import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/vendor_controller.dart';
import 'custom_bottun_vendor.dart';

class ListTitleWithImageOfItem extends StatelessWidget {
  ListTitleWithImageOfItem({
    super.key,
  });

  final VendorController controller = Get.put(VendorController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .07,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CustomButtonVendor(
          text: 'الكل',
          image: 'assets/images/circle.grid.cross.png',
          controller: controller,
          index: 0,
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * .03,
        ),
        itemCount: 1,
      ),
    );
  }
}
