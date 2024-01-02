import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarMaintenance extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMaintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(null),
      actions: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
