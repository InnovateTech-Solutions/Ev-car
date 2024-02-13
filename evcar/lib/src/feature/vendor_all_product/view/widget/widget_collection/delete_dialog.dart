import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/vendor_all_product/controller/vendor_all_peoduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorAllProductController());

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: Container(
        height: context.screenHeight * 0.3,
        width: context.screenWidth * 0.5,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextWidget.mainVendorText("هل تريد حذف المنتج"),
            ),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.screenWidth * 0.27,
                  child: IntroPageButton(
                    text: 'تأكيد',
                    onPressed: () {
                      controller.deleteProduct(id);
                    },
                    colorText: AppTheme.lightAppColors.mainTextcolor,
                    colorButton: AppTheme.lightAppColors.buttoncolor,
                  ),
                ),
                SizedBox(
                  width: context.screenWidth * 0.27,
                  child: IntroPageButton(
                    text: 'الغاء',
                    onPressed: () {
                      Get.back();
                    },
                    colorText: AppTheme.lightAppColors.buttoncolor,
                    colorButton: AppTheme.lightAppColors.mainTextcolor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
