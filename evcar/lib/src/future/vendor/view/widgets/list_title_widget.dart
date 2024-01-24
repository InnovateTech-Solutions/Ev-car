import 'package:evcar/src/future/vendor/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/vendor_controller.dart';

class ListTitleWidget extends StatelessWidget {
  ListTitleWidget({super.key});
  final VendorController controller = Get.put(VendorController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .04,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CustomButtonWidget(
                text: 'الكل',
                controller: controller,
                index: 0,
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width * .03,
              ),
          itemCount: 1),
    );
  }
}
