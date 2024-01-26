import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomAppBarAds extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarAds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(null),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
