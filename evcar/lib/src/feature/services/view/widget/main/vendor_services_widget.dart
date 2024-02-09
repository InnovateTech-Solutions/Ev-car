import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:evcar/src/feature/services/controller/vendor_services_controller.dart';
import 'package:evcar/src/feature/services/view/widget/widget_collection/add_service_widget.dart';
import 'package:evcar/src/feature/services/view/widget/widget_collection/service_form.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/widget_collection/service_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorServicesWidget extends StatelessWidget {
  const VendorServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorServiceaController());

    return Container(
      height: context.screenHeight,
      margin: EdgeInsets.symmetric(
          vertical: context.screenHeight * 0.01,
          horizontal: context.screenWidth * 0.01),
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
      child: Form(
          key: controller.vendorKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => controller.serviceIsEmpty.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget.subVendorTextError('الخدمات *'),
                          TextWidget.subVendorTextError(
                              'اختر الخدمات التي تقدمها في مركز الصيانة الخاص بك'),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget.subVendorText('الخدمات'),
                          Divider(
                            indent: 3,
                            endIndent: 300,
                            thickness: 2,
                            color: Color(0xff000000),
                          ),
                          TextWidget.vendorTextFiledLabel(
                              'اختر الخدمات التي تقدمها في مركز الصيانة الخاص بك'),
                        ],
                      )),
                SizedBox(height: context.screenHeight * 0.018),
                Obx(
                  () => SizedBox(
                    height: controller.serviceIsEmpty.value
                        ? null
                        : context.screenHeight * 0.15,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: (controller.serviceList.length),
                      itemBuilder: (context, index) {
                        final startIndex = index * 3;

                        return Row(
                          children: List.generate(3, (i) {
                            if (startIndex + i <
                                controller.serviceList.length) {
                              final service =
                                  controller.serviceList[startIndex + i];
                              return Container(
                                margin: EdgeInsets.all(
                                    context.screenHeight * 0.002),
                                child: ServiceContainer(
                                  service: service,
                                  callback: () =>
                                      controller.isSelectedService(service),
                                ),
                              );
                            } else {
                              return Expanded(child: SizedBox.shrink());
                            }
                          }),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.018),
                GestureDetector(
                  onTap: () {
                    Get.dialog(AddServices());
                  },
                  child: Container(
                    width: context.screenWidth * 0.4,
                    height: context.screenHeight * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppTheme.lightAppColors.buttoncolor)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(
                          () => TextWidget.vendorTextFiledLabel(
                              controller.title.value == ""
                                  ? 'إسم الخدمه'
                                  : controller.title.value),
                        ),
                        Icon(
                          Icons.add,
                          color: AppTheme.lightAppColors.buttoncolor,
                        ),
                      ],
                    )),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.05),
                TextWidget.vendorTextFiledLabel("وصف خدمات المركز"),
                ServiceForm(
                  formModel: FormModel(
                      controller: controller.description,
                      enableText: false,
                      hintText:
                          "مثال : صيانة جميع انواع السيارات الكهربائية الامريكية والالمانية",
                      invisible: false,
                      validator: (phone) => controller.validDescription(phone),
                      type: TextInputType.name,
                      inputFormat: null,
                      onTap: () {}),
                ),
                SizedBox(height: context.screenHeight * 0.03),
                IntroPageButton(
                    text: "تاكيد",
                    onPressed: () {
                      controller.addService();
                    },
                    colorText: AppTheme.lightAppColors.mainTextcolor,
                    colorButton: AppTheme.lightAppColors.buttoncolor)
              ],
            ),
          )),
    );
  }
}
