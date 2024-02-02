import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/login/view/widget/widget_collection/login_partial.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:evcar/src/feature/register/view/widget/text_widget/register_text.dart';
import 'package:evcar/src/feature/register/view/widget/widget_collectio.dart/register_form_field.dart';
import 'package:evcar/src/feature/register/view/widget/widget_collectio.dart/user_exist_dialog.dart';
import 'package:evcar/src/feature/vendor_account/controller/vendor_controller.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:evcar/src/feature/vendor_account/model/vendor_form_model.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/widget_collection/service_container.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/widget_collection/vendor_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VendorRegisterWidget extends StatelessWidget {
  const VendorRegisterWidget({required this.type, super.key});
  final String type;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorController());
    return SingleChildScrollView(
      child: Form(
        key: controller.vendorKey,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.01),
                padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.02),
                width: context.screenWidth,
                height: context.screenHeight * 2.38,
                decoration: BoxDecoration(
                    color: Color(0xff00a8a8).withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/untitled_1.png",
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
                              controller.validatePhoneNumber(phone),
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
                          controller.hidePassword();
                        },
                        formModel: FormModel(
                          enableText: false,
                          icon: controller.hide.value == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          controller: controller.password,
                          hintText: 'الرقم السري',
                          invisible: controller.hide.value,
                          validator: (password) =>
                              controller.vaildPassword(password),
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
                                controller.validtionFiled(username),
                            type: TextInputType.name,
                            inputFormat: [],
                            onTap: () {})),
                    SizedBox(height: context.screenHeight * 0.018),
                    TextWidget.vendorTextFiledLabel('الخدمة الرئيسية للمركز'),
                    SizedBox(height: context.screenHeight * 0.01),
                    VFormWidget(
                        vendorFormModel: VendorFormModel(
                            controller: controller.subTitle,
                            enableText: false,
                            hintText: 'صيانة السيارات الكهربائية',
                            invisible: false,
                            validator: (subTitle) =>
                                controller.validtionFiled(subTitle),
                            type: TextInputType.name,
                            inputFormat: [],
                            onTap: () {})),
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
                              controller.validtionFiled(address),
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
                    SizedBox(height: context.screenHeight * 0.018),
                    TextWidget.vendorTextFiledLabel('صورة عن السجل التجاري'),
                    SizedBox(height: context.screenHeight * 0.01),
                    GestureDetector(
                      onTap: () => controller.pickLicense(),
                      child: Obx(
                        () => Stack(
                          children: [
                            VFormWidget(
                                vendorFormModel: VendorFormModel(
                              controller: controller.pBase64,
                              enableText: true,
                              hintText: controller.imageLicense.value.isEmpty
                                  ? 'اختر صورة'
                                  : 'تم الاختيار شكر لك',
                              invisible: false,
                              validator: null,
                              type: TextInputType.name,
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
                    SizedBox(height: context.screenHeight * 0.06),
                    Column(
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
                      ],
                    ),
                    // Divider(
                    //   indent: 3,
                    //   endIndent: 300,
                    //   thickness: 2,
                    //   color: Color(0xff000000),
                    // ),
                    // TextWidget.vendorTextFiledLabel(
                    //     'اختر الخدمات التي تقدمها في مركز الصيانة الخاص بك'),
                    SizedBox(height: context.screenHeight * 0.018),
                    Obx(
                      () => Expanded(
                        flex: controller.serviceIsEmpty.value ? 2 : 1,
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
                                  return Expanded(
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
                    TextWidget.vendorTextFiledLabel('وصف خدمات المركز'),
                    SizedBox(height: context.screenHeight * 0.018),
                    VFormWidget(
                        line: 5,
                        vendorFormModel: VendorFormModel(
                            controller: controller.description,
                            enableText: false,
                            hintText:
                                'مثال : صيانة جميع انواع السيارات الكهربائية الامريكية والالمانية',
                            invisible: false,
                            validator: (description) =>
                                controller.validtionFiled(description),
                            type: TextInputType.name,
                            inputFormat: [],
                            onTap: () {})),
                    Expanded(child: Container()),
                    IntroPageButton(
                      text: 'إنشاء حساب',
                      onPressed: () async {
                        print('object');

                        bool vendorExits = await controller.fetchVendorExistence(
                            '962${controller.removeLeadingZero(controller.phoneNumber.text)}');

                        if (!vendorExits) {
                          controller.onSignup(type);
                        } else {
                          userExistDialog(context, ("المستخدم موجود مسبقا"));
                        }
                        print('the value $vendorExits');
                        // (
                        //  controller.onSignup(Vendor(
                        //     title: controller.username.text,
                        //     subtitle: controller.subTitle.text,
                        //     img: controller.imageUrl,
                        //     address: controller.address.text,
                        //     number: controller.phoneNumber.text,
                        //     commercialLicense: controller.licenceUrl,
                        //     password: controller.password.text,
                        //     type: type,
                        //     tags: [],
                        //     description: controller.description.text,
                        //     status: 'Pending'))
                        //     );
                      },
                      colorText: AppTheme.lightAppColors.mainTextcolor,
                      colorButton: AppTheme.lightAppColors.buttoncolor,
                    ),
                    SizedBox(height: 0.03 * context.screenHeight),
                    Center(
                      child: SizedBox(
                        width: 0.65 * context.screenWidth,
                        child: RegisterText.textButton(),
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.02),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
