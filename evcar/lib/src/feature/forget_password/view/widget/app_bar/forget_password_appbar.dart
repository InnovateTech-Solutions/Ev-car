import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ForgetPasswordAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/border.png'),
            ),
            Image(
              image: AssetImage('assets/images/arrowback.png'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
