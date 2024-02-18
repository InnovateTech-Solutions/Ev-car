import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/mobile_charger/controller/mobile_charger_controller.dart';
import 'package:evcar/src/feature/review/controller/rating_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductPhoneButton extends StatelessWidget {
  const ProductPhoneButton({super.key, required this.phone, required this.id});
  final String phone;
  final String id;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MobileChargerController());
    final controllerr = Get.put(RatinggController());

    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: AppTheme.lightAppColors.buttoncolor),
          child: Center(
            child: GestureDetector(
              onTap: () {
                controller.launchPhoneCall(phone);
                controllerr.toggleReviewed(id);
              },
              child: Text(
                'اتصل الان',
                style: TextStyle(
                  color: AppTheme.lightAppColors.background,
                  fontFamily: 'cairo-Medium',
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 50,
        ),
        GestureDetector(
            onTap: () {
              controller.openWhatsAppChat(phone);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: AppTheme.lightAppColors.buttoncolor,
                  )),
              child:
                  Center(child: SvgPicture.asset("assets/images/whatsapp.svg")),
            ))
      ],
    );
  }
}
