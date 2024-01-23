import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/create_account/create_account/model/user_card_model.dart';
import 'package:evcar/src/feature/create_account/create_account/view/widget/text_widget/text_widget.dart';
import 'package:flutter/material.dart';

class SeletectUserCard extends StatelessWidget {
  const SeletectUserCard({required this.userCardModel, super.key});
  final UserCardModel userCardModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: userCardModel.voidCallback,
      child: Container(
        height: context.screenHeight * 0.14,
        width: context.screenWidth,
        decoration: BoxDecoration(
          color: AppTheme.lightAppColors.background,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(userCardModel.image,
                width: context.screenWidth * 0.21,
                height: context.screenHeight * 0.21),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: context.screenHeight * 0.025,
                  horizontal: context.screenWidth * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CreateAccountText.mainCreateAccountText(userCardModel.title),
                  CreateAccountText.subCreateAccountText(
                      userCardModel.description)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
