import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/services/controller/vendor_services_controller.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/widget_collection/vendor_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../vendor_account/model/vendor_form_model.dart';

class AddServices extends StatelessWidget {
  const AddServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorServiceaController());

    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        content: Container(
          height: context.screenHeight * 0.5,
          width: context.screenWidth,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
              key: controller.dialogKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.screenHeight * 0.018),
                    TextWidget.vendorTextFiledLabel('رقم الموبايل'),
                    SizedBox(height: context.screenHeight * 0.01),
                    VFormWidget(
                        vendorFormModel: VendorFormModel(
                      controller: controller.phoneNumber,
                      enableText: false,
                      hintText: 'مثال : 0799393945',
                      invisible: false,
                      validator: (phone) =>
                          controller.validatePhoneNumber(phone),
                      type: TextInputType.phone,
                      inputFormat: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onTap: () {},
                    )),
                    SizedBox(height: context.screenHeight * 0.018),
                    TextWidget.vendorTextFiledLabel('إسم الخدمه'),
                    SizedBox(height: context.screenHeight * 0.01),
                    VFormWidget(
                        vendorFormModel: VendorFormModel(
                            controller: controller.newService,
                            enableText: false,
                            hintText: 'مثال : فحص بطاريات',
                            invisible: false,
                            validator: (username) =>
                                controller.validtionFiled(username),
                            type: TextInputType.name,
                            inputFormat: [],
                            onTap: () {})),
                    SizedBox(height: context.screenHeight * 0.018),
                    Center(
                      child: IntroPageButton(
                          text: "تاكيد",
                          onPressed: () {
                            controller.addNewService();
                          },
                          colorText: AppTheme.lightAppColors.mainTextcolor,
                          colorButton: AppTheme.lightAppColors.buttoncolor),
                    ),
                  ])),
        ));
  }
}
