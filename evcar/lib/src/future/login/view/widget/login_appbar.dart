import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarLogin extends StatelessWidget implements PreferredSizeWidget {
  const AppBarLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(null),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .04,
          ),
          child: InkWell(
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
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
