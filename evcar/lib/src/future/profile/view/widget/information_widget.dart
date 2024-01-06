import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/profile/controller/profile_controller.dart';
import 'package:evcar/src/future/profile/view/widget/text_form_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custem_button.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
  final controller = Get.put(ProfileController());

    return SingleChildScrollView(
      child: Form(
        key: controller.fromKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
             TextFormProfile(
              label: 'الاسم',
              textController: controller.username ,
            ),
            SizedBox(
            height: MediaQuery.of(context).size.height * .03,
            ),
           TextFormProfile(
              label: 'رقم الهاتف',
              textController:controller.phoneNumber,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
           TextFormProfile(
              label: 'نوع السيارة',
              textController:controller.carType ,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      right: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: CustemButton(
                      onPressed: () {
                        controller.putUserDetails(controller.username.text, controller.carType.text);
                      },
                      text: 'تعديل',
                      colorText: AppTheme.lightAppColors.background,
                      colorButton: AppTheme.lightAppColors.buttoncolor,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.02,
                      left: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: CustemButton(
                      onPressed: () {},
                      text: 'إلغاء',
                      colorText: AppTheme.lightAppColors.buttoncolor,
                      colorButton: AppTheme.lightAppColors.background,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
