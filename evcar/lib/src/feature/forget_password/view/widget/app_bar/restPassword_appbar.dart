import 'package:evcar/src/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestPasswordAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const RestPasswordAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Get.offAllNamed(AppRoutes.login);
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
