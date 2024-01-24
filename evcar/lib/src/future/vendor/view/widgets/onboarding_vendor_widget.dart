import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import '../../controller/vendor_controller.dart';
import 'indicator_widget.dart';

class OnBoardingVendorWidget extends StatelessWidget {
  OnBoardingVendorWidget({super.key});

  final VendorController controller = Get.put(VendorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * .01,
        horizontal: MediaQuery.of(context).size.width * .03,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/onBoardingVendor.png'),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.textstyle22('عروض خاصة', Colors.red),
          SizedBox(
            height: MediaQuery.of(context).size.height * .003,
          ),
          Styles.textstyle29('شحن مجاني', Colors.white),
          SizedBox(
            height: MediaQuery.of(context).size.height * .003,
          ),
          Styles.textstyle15(
            'يحصل المستخدمون لأول مرة على\n رسوم مجانية تصل إلى 80%',
            Colors.white,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Styles.textstyle17normal(
                  'اطلع على المزيد',
                  const Color.fromRGBO(51, 255, 255, 1),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(51, 255, 255, 1),
                  size: 20,
                )
              ],
            ),
          ),
          const Spacer(),
          Obx(
            () => IndicatorWidget(
              count: controller.imageCount.value,
              currentPage: controller.currentPage.value,
            ),
          ),
        ],
      ),
    );
  }
}
