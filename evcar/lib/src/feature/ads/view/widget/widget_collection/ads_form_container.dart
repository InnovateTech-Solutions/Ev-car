import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/ads/view/widget/text/ads_text.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/ads_from_widget.dart';
import 'package:evcar/src/feature/login/view/widget/widget_collection/login_partial.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:flutter/material.dart';

class AdsFormContainer extends StatelessWidget {
  const AdsFormContainer({
    super.key,
    required this.title,
    required this.formModel,
  });
  final String title;
  final FormModel formModel;

  @override
  Widget build(BuildContext context) {
    return title == "وصف الاعلان "
        ? Container(
            padding: EdgeInsets.only(
                left: context.screenWidth * 0.03,
                right: context.screenWidth * 0.03,
                top: context.screenHeight * 0.04),
            width: context.screenWidth,
            height: context.screenHeight * 0.35,
            decoration: BoxDecoration(
                color: AppTheme.lightAppColors.background,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdsText.secText(title),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                AdsFormWidget(
                  formModel: formModel,
                  name: title,
                )
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.only(
                left: context.screenWidth * 0.03,
                right: context.screenWidth * 0.03,
                top: context.screenHeight * 0.04),
            width: context.screenWidth,
            height: context.screenHeight * 0.2,
            decoration: BoxDecoration(
                color: AppTheme.lightAppColors.background,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdsText.secText(title),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                Stack(
                  children: [
                    AdsFormWidget(formModel: formModel),
                    title == "رقم الهاتف"
                        ? Row(
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
                          )
                        : Container()
                  ],
                )
              ],
            ),
          );
  }
}
