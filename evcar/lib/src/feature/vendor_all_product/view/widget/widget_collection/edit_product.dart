import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/vendor_account/model/vendor_form_model.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/widget_collection/vendor_form_widget.dart';
import 'package:evcar/src/feature/vendor_all_product/controller/vendor_all_peoduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key, required this.product});
  final Product product;

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final controller = Get.put(VendorAllProductController());

  @override
  void initState() {
    controller.title.text = widget.product.title;
    controller.discription.text = widget.product.description;
    controller.price.text = widget.product.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        content: Container(
          height: context.screenHeight,
          width: context.screenWidth,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.screenWidth * 0.7,
                  height: context.screenHeight * 0.2,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          widget.product.img[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                TextWidget.vendorTextFiledLabel("أسم القطعة"),
                VFormWidget(
                    vendorFormModel: VendorFormModel(
                  controller: controller.title,
                  enableText: false,
                  hintText: "أسم القطعة",
                  invisible: false,
                  validator: (value) => controller.validname(value),
                  type: TextInputType.text,
                  onTap: () {},
                  inputFormat: [],
                )),
                SizedBox(height: context.screenHeight * 0.02),
                TextWidget.vendorTextFiledLabel("الوصف"),
                VFormWidget(
                    vendorFormModel: VendorFormModel(
                  controller: controller.discription,
                  enableText: false,
                  hintText: "الوصف",
                  invisible: false,
                  validator: (value) => controller.validdescription(value),
                  type: TextInputType.text,
                  onTap: () {},
                  inputFormat: [],
                )),
                SizedBox(height: context.screenHeight * 0.02),
                TextWidget.vendorTextFiledLabel("السعر"),
                VFormWidget(
                    vendorFormModel: VendorFormModel(
                  controller: controller.price,
                  enableText: false,
                  hintText: "السعر",
                  invisible: false,
                  validator: (value) => controller.validprice(value),
                  type: TextInputType.number,
                  onTap: () {},
                  inputFormat: [],
                )),
                SizedBox(height: context.screenHeight * 0.07),
                IntroPageButton(
                    text: "تعديل",
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.updateProduct(widget.product.id);
                      } else {
                        Get.snackbar(
                          "ERROR",
                          "Invalid Data",
                          titleText: Align(
                            alignment: Alignment
                                .topRight, // Set your desired alignment
                            child: searchsec('حدث خطأ'),
                          ),
                        );
                      }
                    },
                    colorText: AppTheme.lightAppColors.mainTextcolor,
                    colorButton: AppTheme.lightAppColors.buttoncolor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
