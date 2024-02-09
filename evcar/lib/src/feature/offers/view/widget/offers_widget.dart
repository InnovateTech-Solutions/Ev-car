import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/offers/controller/offers_controller.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:evcar/src/feature/services/view/widget/widget_collection/service_form.dart';
import 'package:evcar/src/feature/vendor_account/model/vendor_form_model.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/widget_collection/vendor_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OffersController());
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: context.screenHeight * 0.01,
          horizontal: context.screenWidth * 0.01),
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
      child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget.subVendorText('العروض'),
              Divider(
                indent: 3,
                endIndent: context.screenWidth * 0.7,
                thickness: 2,
                color: Color(0xff000000),
              ),
              SizedBox(height: context.screenHeight * 0.018),
              TextWidget.vendorTextFiledLabel(
                  "اختر العروض الخاصة بك التي تقدمها "),
              SizedBox(height: context.screenHeight * 0.018),
              TextWidget.subVendorText('أضف صورة العرض'),
              SizedBox(height: context.screenHeight * 0.018),
              GestureDetector(
                onTap: () => controller.pickImage(),
                child: Obx(
                  () => Container(
                    width: context.screenWidth * 0.35,
                    height: context.screenHeight * 0.15,
                    decoration: BoxDecoration(
                      color: AppTheme.lightAppColors.background,
                      border: Border.all(
                        color: AppTheme.lightAppColors.bordercolor,
                        width: context.screenWidth * 0.005,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      image: controller.imagePath.value != ""
                          ? DecorationImage(
                              image: FileImage(
                              controller.sotreImageFile!,
                            ))
                          : DecorationImage(
                              image: AssetImage("assets/images/immg.png")),
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.screenHeight * 0.018),
              TextWidget.vendorTextFiledLabel('أسم العرض'),
              SizedBox(height: context.screenHeight * 0.01),
              VFormWidget(
                  vendorFormModel: VendorFormModel(
                controller: controller.title,
                enableText: false,
                hintText: 'مثال : العرض الاقوى ',
                invisible: false,
                validator: (phone) => controller.validtionFiled(phone),
                type: TextInputType.phone,
                inputFormat: [],
                onTap: () {},
              )),
              SizedBox(height: context.screenHeight * 0.018),
              TextWidget.vendorTextFiledLabel('وصف العرض'),
              SizedBox(height: context.screenHeight * 0.01),
              ServiceForm(
                formModel: FormModel(
                    controller: controller.description,
                    enableText: false,
                    hintText: "مثال : خصم 25% على جميع قطع الغيار ",
                    invisible: false,
                    validator: (phone) => controller.validDescription(phone),
                    type: TextInputType.name,
                    inputFormat: null,
                    onTap: () {}),
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              IntroPageButton(
                  text: "تاكيد",
                  onPressed: () {
                    controller.addOffers();
                  },
                  colorText: AppTheme.lightAppColors.mainTextcolor,
                  colorButton: AppTheme.lightAppColors.buttoncolor)
            ],
          ))),
    );
  }
}
