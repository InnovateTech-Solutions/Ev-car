import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargeStationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChargeStationAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontFamily: 'cairo-SemiBold',
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
