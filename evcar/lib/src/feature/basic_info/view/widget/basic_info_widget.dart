import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/basic_info/controller/basic_info_controller.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/login/view/widget/widget_collection/login_partial.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:evcar/src/feature/vendor_account/controller/vendor_controller.dart';
import 'package:evcar/src/feature/vendor_account/model/vendor_form_model.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/widget_collection/vendor_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BasicInformationWidget extends StatefulWidget {
  const BasicInformationWidget({super.key, required this.token});
  final String token;
  @override
  State<BasicInformationWidget> createState() => _BasicInformationWidgetState();
}

class _BasicInformationWidgetState extends State<BasicInformationWidget> {
  final controller = Get.put(BasicInformationController());
  final vendorController = Get.put(VendorController());
  final registerToken = Get.put(UserRegisterController());
  final loginToken = Get.put(LoginController());

  @override
  void initState() {
    controller
        .getUserDetails(registerToken.token.value + loginToken.token.value);
    print(controller
        .getUserDetails(registerToken.token.value + loginToken.token.value));

    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getUserDetails(widget.token),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.symmetric(
                  vertical: context.screenHeight * 0.01,
                  horizontal: context.screenWidth * 0.01),
              padding:
                  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
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
                            enableText: true,
                            hintText: 'مثال : 0799393945',
                            invisible: false,
                            validator: null,
                            type: TextInputType.phone,
                            inputFormat: [
                              LengthLimitingTextInputFormatter(13),
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
                                  child:
                                      Image.asset("assets/images/jordan.png")),
                              SizedBox(
                                width: context.screenWidth * 0.02,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.018),
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
                                validator: null,
                                type: TextInputType.none,
                                inputFormat: [],
                                onTap: () {},
                              )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 0.079 * context.screenHeight,
                                    child: Image.asset(
                                        "assets/images/untitled (9).png"),
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
                                child: Image.asset(
                                    "assets/images/untitled (10).png"),
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
                              controller.onUpdate(
                                  token: registerToken.token.value +
                                      loginToken.token.value,
                                  userName: controller.username.text,
                                  address: controller.address.text);

                              if (controller.formKey.currentState!.validate()) {
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
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.lightAppColors.bordercolor,
              ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppTheme.lightAppColors.bordercolor,
            ),
          );
        }
      },
    );
  }
}
