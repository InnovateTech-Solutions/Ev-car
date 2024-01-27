import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/create_account/create_account/controller/user_card_controller.dart';
import 'package:evcar/src/feature/create_account/create_account/view/widget/widget_collection/selectuser_card.dart';
import 'package:evcar/src/feature/login/view/widget/text_widget/login_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountWidget extends GetView<UserCardController> {
  const CreateAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserCardController());
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginText.mainLoginText('إنشاء الحساب'),
          SizedBox(height: 0.02 * context.screenHeight),
          LoginText.subLoginText(
              'يرجى إختيار نوع الحساب التي تود ان تقوم بتسجيل به'),
          SizedBox(height: 0.05 * context.screenHeight),
          SizedBox(
              width: context.screenWidth,
              height: context.screenHeight * 0.6,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: context.screenHeight * 0.05);
                  },
                  itemCount: controller.userCards.length,
                  itemBuilder: (context, index) {
                    final userCard = controller.userCards[index];
                    return SeletectUserCard(userCardModel: userCard);
                  }))
        ],
      ),
    );
  }
}
