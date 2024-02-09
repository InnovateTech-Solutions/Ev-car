import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/basic_info/controller/basic_info_controller.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/login/view/widget/widget_collection/login_partial.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:evcar/src/feature/register/view/widget/widget_collectio.dart/register_form_field.dart';
import 'package:evcar/src/feature/vendor_account/controller/vendor_controller.dart';
import 'package:evcar/src/feature/vendor_account/model/vendor_form_model.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/widget_collection/vendor_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BasicInformationWidget extends StatefulWidget {
  const BasicInformationWidget({super.key});

  @override
  State<BasicInformationWidget> createState() => _BasicInformationWidgetState();
}

class _BasicInformationWidgetState extends State<BasicInformationWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BasicInformationController());
    final vendorController = Get.put(VendorController());

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
              TextWidget.subVendorText('المعلومات الأساسية'),
              Divider(
                indent: 3,
                endIndent: 210,
                thickness: 2,
                color: Color(0xff000000),
              ),
              SizedBox(height: context.screenHeight * 0.018),
              TextWidget.vendorTextFiledLabel('رقم الموبايل'),
              SizedBox(height: context.screenHeight * 0.01),
              Stack(
                children: [
                  VFormWidget(
                      vendorFormModel: VendorFormModel(
                    controller: controller.phoneNumber,
                    enableText: false,
                    hintText: 'مثال : 0799393945',
                    invisible: false,
                    validator: (phone) =>
                        vendorController.validatePhoneNumber(phone),
                    type: TextInputType.phone,
                    inputFormat: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onTap: () {},
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      verticalDivider(),
                      Text(
                        "+962",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.02,
                      ),
                      SizedBox(
                          height: 0.05 * context.screenHeight,
                          child: Image.asset("assets/images/jordan.png")),
                      SizedBox(
                        width: context.screenWidth * 0.02,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: context.screenHeight * 0.018),
              TextWidget.vendorTextFiledLabel('الرقم السري'),
              SizedBox(height: context.screenHeight * 0.01),
              Obx(
                () => FormWidget(
                  ontap: () {
                    vendorController.hidePassword();
                  },
                  formModel: FormModel(
                    enableText: false,
                    icon: vendorController.hide.value == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    controller: controller.password,
                    hintText: 'الرقم السري',
                    invisible: vendorController.hide.value,
                    validator: (password) =>
                        vendorController.vaildPassword(password),
                    type: TextInputType.visiblePassword,
                    inputFormat: null,
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(height: context.screenHeight * 0.018),
              TextWidget.vendorTextFiledLabel('إسم المركز'),
              SizedBox(height: context.screenHeight * 0.01),
              VFormWidget(
                  vendorFormModel: VendorFormModel(
                      controller: controller.username,
                      enableText: false,
                      hintText: 'مثال : مركز الجودة للصيانة',
                      invisible: false,
                      validator: (username) =>
                          vendorController.validtionFiled(username),
                      type: TextInputType.name,
                      inputFormat: [],
                      onTap: () {})),
              SizedBox(height: context.screenHeight * 0.018),
              SizedBox(height: context.screenHeight * 0.018),
              TextWidget.vendorTextFiledLabel('صورة المركز'),
              SizedBox(height: context.screenHeight * 0.01),
              GestureDetector(
                onTap: () => controller.pickImage(),
                child: Obx(
                  () => Stack(
                    children: [
                      VFormWidget(
                          vendorFormModel: VendorFormModel(
                        controller: controller.pictureBase64,
                        enableText: true,
                        hintText: controller.imagePath.value.isEmpty
                            ? 'اختر صورة'
                            : 'تم الاختيار شكر لك',
                        invisible: false,
                        validator: (username) =>
                            vendorController.validtionImageFiled(username),
                        type: TextInputType.none,
                        inputFormat: [],
                        onTap: () {},
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 0.079 * context.screenHeight,
                            child:
                                Image.asset("assets/images/untitled (9).png"),
                          ),
                          SizedBox(width: context.screenWidth * 0.003),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.screenHeight * 0.018),
              TextWidget.vendorTextFiledLabel('عنوان المركز'),
              SizedBox(height: context.screenHeight * 0.01),
              Stack(
                children: [
                  VFormWidget(
                      vendorFormModel: VendorFormModel(
                    controller: controller.address,
                    enableText: false,
                    hintText: 'مثال : عمان البيادر خلف معرض مرسيدس',
                    invisible: false,
                    validator: (address) =>
                        vendorController.validtionFiled(address),
                    type: TextInputType.streetAddress,
                    inputFormat: null,
                    onTap: () {},
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 0.079 * context.screenHeight,
                        child: Image.asset("assets/images/untitled (10).png"),
                      ),
                      SizedBox(width: context.screenWidth * 0.003),
                    ],
                  ),
                ],
              ),
              SizedBox(height: context.screenHeight * 0.03),
              Center(
                child: IntroPageButton(
                    text: "تاكيد",
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        print(controller.phoneNumber.text);
                        print(controller.password.text);
                        print(controller.username.text);
                        print(controller.imagePath);
                        print(controller.address.text);
                      } else {
                        print("NotValid");
                      }
                    },
                    colorText: AppTheme.lightAppColors.mainTextcolor,
                    colorButton: AppTheme.lightAppColors.buttoncolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
