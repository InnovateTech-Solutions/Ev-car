import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/vendor_account/controller/vendor_controller.dart';
import 'package:evcar/src/feature/vendor_account/model/vendor_form_model.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/widget_collection/vendor_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VendorRegisterWidget extends StatelessWidget {
  const VendorRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorController());
    return Column(
      children: [
        Container(
            margin:
                EdgeInsets.symmetric(horizontal: context.screenWidth * 0.01),
            width: context.screenWidth,
            height: context.screenHeight * 0.82869,
            decoration: BoxDecoration(
                color: Color(0xff00a8a8).withOpacity(0.2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/untitled (1).png",
                  width: context.screenWidth * 3,
                  height: context.screenHeight * 0.2,
                ),
                TextWidget.mainVendorText('إنشاء حساب مركز صيانة'),
                SizedBox(height: context.screenHeight * 0.02),
                TextWidget.subVendorText('المعلومات الأساسية'),
                Divider(
                  indent: 3,
                  endIndent: 210,
                  thickness: 2,
                  color: Color(0xff000000),
                ),
                Form(
                    key: controller.vendorKey,
                    child: Column(
                      children: [
                        VendorFormWidget(
                            vendorFormModel: VendorFormModel(
                          controller: controller.phoneNumber,
                          enableText: false,
                          hintText: 'Phone Number',
                          invisible: false,
                          validator: (phone) =>
                              controller.validatePhoneNumber(phone),
                          type: TextInputType.phone,
                          inputFormat: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onTap: () {},
                        ))
                      ],
                    ))
              ],
            ))
      ],
    );
  }
}
